# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Project < ActiveRecord::Base
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
end
