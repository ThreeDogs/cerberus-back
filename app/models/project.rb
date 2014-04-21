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
  default_scope { joins(:total_reports).order('total_reports.created_at DESC') } 
  mount_uploader :icon, IconUploader

	belongs_to :user
	has_many :apks
	has_many :total_reports
	has_many :test_scenarios

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

  def get_icon
    # icon.
    icon.blank? ? "/assets/default_app_icon.png" : icon.to_s
  end

  def get_color_band
    result = "color_band"
    # state _fail, _warning
  end
end
