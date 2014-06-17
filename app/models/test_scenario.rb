# == Schema Information
#
# Table name: test_scenarios
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  description   :string(255)
#  export_code   :string(255)
#  activity_name :string(255)
#  package_name  :string(255)
#  rank          :integer          default(0)
#  project_id    :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class TestScenario < ActiveRecord::Base
  before_validation :name_generate
  before_create :make_export_code_folder
  after_create :export_code_generate_callback
	default_scope {order('created_at DESC')}
  belongs_to :project

  has_many :motion_events, dependent: :destroy
  accepts_nested_attributes_for :motion_events
  has_many :detail_reports

  has_many :scenarioships
  has_many :total_reports, through: :scenarioships

  # validates :name, presence: true
  # validates :description, presence: true
  # validates :rank, presence: true

  # rank 0,1,2,3 A,B,C,D

  def status
    if detail_reports.where("status = ?", -1).count >= 1
      "Fail"
    else
      "Pass"
    end
  end

  def errors
    detail_reports.collect{|d| d.crash }.uniq
  end

  def devices
    detail_reports.collect{|d| d.device }.uniq
  end

  def devices_number
    devices.length
  end

  def get_rank
    results = ["A","B","C","D"]
    results[rank]
  end

  def recent_test_date
    detail_reports.first.test_date unless detail_reports.blank?
  end
  
  def export_code_generate_callback
    ExportCodeWorker.perform_async(id)
  end

  def export_code_generate
    code_export_folder_path = "#{Rails.root}/lib/codeExport"
    target_path = "/uploads/#{self.class.to_s.underscore}/export_code/#{self.id}/"
    target_folder_full_path = "#{Rails.root}/public#{target_path}"
    sysout = `java -classpath #{code_export_folder_path}/codeExport.jar:#{code_export_folder_path}/gson-2.2.4.jar:#{code_export_folder_path}/httpclient-4.3.3.jar:#{code_export_folder_path}/httpcore-4.3.2.jar:#{code_export_folder_path}/httpmine-4.3.3.jar:#{code_export_folder_path}/commons-logging-1.1.3.jar export.scenario.cerberus.JavaCodeMaker #{activity_name} #{package_name} #{id} #{target_folder_full_path}`
    result = sysout.match(/~~\S*~~/)[0]
    result = result.gsub(/~~/,'')

    if result
      update!(export_code: result)
      puts "Success"
    else
      puts "Exception File Name is Error"
    end
  end

  private 

  def name_generate
    self.name ||= "TestScenario #{DateTime.now.to_s}"
  end

  def make_export_code_folder
    `mkdir #{Rails.root}/public/uploads/#{self.class.to_s.underscore}/`
    `mkdir #{Rails.root}/public/uploads/#{self.class.to_s.underscore}/export_code/`
  end
end
