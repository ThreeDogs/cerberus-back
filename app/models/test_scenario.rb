# == Schema Information
#
# Table name: test_scenarios
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  description     :string(255)
#  rank            :integer
#  project_id      :integer
#  scenarioship_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class TestScenario < ActiveRecord::Base
  before_validation :name_generate
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

  private 

  def name_generate
    self.name ||= "TestScenario #{DateTime.now.to_s}"
  end
end
