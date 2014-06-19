# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  icon       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Project < ActiveRecord::Base
  # mount_uploader :icon, IconUploader

	belongs_to :user
	has_many :apks
	has_many :total_reports

	has_many :test_scenarios
  has_many :test_codes
  
  has_many :devices

	validates :name, presence: true
  validates :user_id, presence: true

  def complete_total_reports
  	total_reports.complete_total_reports
  end

  def recent_total_report
  	complete_total_reports.first
  end

  def recent_report_app_version
    recent_total_report.app_version    
  end

  def recent_report_test_date
    recent_total_report.test_date
  end

  def recent_report_created_at
    recent_total_report.created_at
  end

  def recent_report_rank_status
    recent_total_report.test_rank_status
  end

  # icon.
  def get_icon
    icon.blank? ? "/assets/default_app_icon.png" : icon
  end

  # state _fail, _warning
  def get_color_band
    if self.id == 1
      "color_band" 
    elsif self.id == 2
      "color_band_warning"
    else
      "color_band_fail"
    end 
  end

  def test_names
    test_scenarios.collect{|t| t.name}
  end

  def test_ranks
    result = {}
    keys = (ranks = test_scenarios.collect{|t| t.get_rank}).uniq
    keys.each do |k|
      result["#{k}"] = ranks.select{|r| r == k}.length
    end
    result
  end
end
