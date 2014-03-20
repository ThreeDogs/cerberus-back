# == Schema Information
#
# Table name: detail_reports
#
#  id               :integer          not null, primary key
#  app_version      :string(255)
#  test_datetime    :string(255)
#  status           :integer
#  running_time     :integer
#  test_scenario_id :integer
#  device_id        :integer
#  total_report_id  :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class DetailReport < ActiveRecord::Base
  belongs_to :test_scenario
  belongs_to :total_report

  validates :app_version, presence: true
end
