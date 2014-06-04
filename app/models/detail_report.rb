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
#  crash_id         :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class DetailReport < ActiveRecord::Base
  default_scope {order('created_at DESC')}
	belongs_to :device, foreign_key: 'device_key', primary_key: 'device_key'
  belongs_to :test_scenario
  belongs_to :total_report
  belongs_to :crash

  has_many :memory_infos
  has_many :cpu_infos
  has_many :motion_event_infos

  accepts_nested_attributes_for :memory_infos
  accepts_nested_attributes_for :cpu_infos
  accepts_nested_attributes_for :motion_event_infos

  # validates :app_version, presence: true

  def error_name
    crash.error_name
  end

  def rank
    test_scenario.get_rank
  end

  def test_scenario_name
    test_scenario.name
  end

  def test_date
    created_at.strftime("%y.%m.%d. %I:%M %p")
  end

  def device_name
    device.model
  end

  def device_country
    device.country
  end

  def os_version
    device.os_version
  end

  def get_running_time
    "#{running_time}s"
  end

  # status -1 : Fail, 1: Pass
  def get_status
    case status
    when 1
      "Pass"
    when 0
      "Warning"
    when -1
      "Fail"
    else
      "Error"
    end
  end

  def screenshots
    motion_event_infos.collect{|m| m.screen }
  end

  def memory_average
    # "#{performace_average(memory_infos, "dalvik_heap_size")} Mb"
  end

  def cpu_average
    # "#{performace_average(cpu_infos, "usage")} %"
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

  def performace_average(performace, attribute)
    performace.inject(0){|sum,p| sum += p.send(attribute) } / performace.size
  end

  def project_id
  	total_report.project.id
  end
end
