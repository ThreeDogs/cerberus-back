# == Schema Information
#
# Table name: detail_reports
#
#  id               :integer          not null, primary key
#  app_version      :string(255)
#  test_datetime    :string(255)
#  status           :integer
#  running_time     :float
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

  def rank
    test_scenario.get_rank
  end

  def test_scenario_name
    test_scenario.name
  end

  def device_name
    device.model
  end

  def os_version
    device.os_version
  end

  def get_running_time
    "#{running_time}s"
  end

  # status -1 : Fail, 1: Pass
  def get_status
    status == 1 ? "Pass" : "Fail"
  end

  def screenshots
    motion_event_infos.collect{|m| m.screen }
  end

  def memory_average
    # implement..
    "20.00mb"
  end

  def cpu_average
    # implement..
    "11%"
  end

  def network_average
    # implement..
    "2394 kb/s"
  end

  def battery_consumption
    # implement..
    "normal"
  end

  def threads_average
    # implement..
    "34"
  end

  def frame_draw_time_average
    # implement..
    "11.27ms"
  end

  def project_id
  	total_report.project.id
  end
end
