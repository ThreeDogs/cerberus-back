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
  mount_uploader :icon, IconUploader

	belongs_to :user
	has_many :apks
	has_many :total_reports
	has_many :test_scenarios
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
    icon.blank? ? "/assets/default_app_icon.png" : icon.to_s
  end

  # state _fail, _warning
  def get_color_band
    return "color_band_fail" if recent_report_rank_status["A"][1] >= 1 or recent_report_rank_status["B"][1] >= 5
    return "color_band_warning" if recent_report_rank_status["B"][1] >= 1 or recent_report_rank_status["C"][1] >= 1 or recent_report_rank_status["D"][1] >= 1
    "color_band"
  end
end
