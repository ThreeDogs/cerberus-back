# == Schema Information
#
# Table name: detail_reports
#
#  id               :integer          not null, primary key
#  app_version      :string(255)
#  test_datetime    :string(255)
#  status           :integer
#  running_time     :integer
#  device_key       :string(255)
#  test_scenario_id :integer
#  total_report_id  :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class DetailReport < ActiveRecord::Base
	belongs_to :device, foreign_key: 'device_key', primary_key: 'device_key'
  belongs_to :test_scenario
  belongs_to :total_report

  has_many :memory_infos
  has_many :cpu_infos
  has_many :motion_event_infos

  accepts_nested_attributes_for :memory_infos
  accepts_nested_attributes_for :cpu_infos
  accepts_nested_attributes_for :motion_event_infos

  validates :app_version, presence: true

  def project_id
  	total_report.project.id
  end
end
