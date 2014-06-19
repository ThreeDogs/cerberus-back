# == Schema Information
#
# Table name: detail_reports
#
#  id               :integer          not null, primary key
#  app_version      :string(255)
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
  belongs_to :test_code
  belongs_to :total_report
  belongs_to :crash

  has_many :memory_infos
  has_many :cpu_infos
  has_many :motion_event_infos
  has_many :battery_infos
  has_many :network_infos
  has_many :cpu_methods
  has_many :frame_draw_times

  accepts_nested_attributes_for :memory_infos
  accepts_nested_attributes_for :cpu_infos
  accepts_nested_attributes_for :motion_event_infos
  accepts_nested_attributes_for :battery_infos
  accepts_nested_attributes_for :network_infos
  accepts_nested_attributes_for :cpu_methods
  accepts_nested_attributes_for :frame_draw_times


  # validates :app_version, presence: true

  def error_name
    crash.error_name if crash
  end

  def rank
    if test_scenario
      return test_scenario.get_rank
    end
    "A"
  end

  def test_scenario_name
    if test_scenario
      return test_scenario.name
    end
    "A"
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
    "#{performace_average(memory_infos, "dalvik_heap_size")} Kb"
  end

  def cpu_average
    "#{performace_average(cpu_infos, "usage")} %"
  end

  def network_average
    "#{performace_average(network_infos, "response_size")} byte"
  end

  def battery_consumption
    battery_average = (performace_average(battery_infos, "cpu") + performace_average(battery_infos, "lcd"))/2
    "#{battery_average} J"
  end

  def threads_average
    "34"
  end

  def frame_draw_time_average
    frame_times = frame_draw_times.collect{|f| f.load_finish_timestamp - f.load_start_timestamp}
    frame_average = frame_times.inject(:+) / frame_times.length
    "#{frame_average} ms"
  end

  def performace_average(performace, attribute)
    performace.inject(0){|sum,p| sum += p.send(attribute) } / performace.size
  end

  def project_id
  	total_report.project.id
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      # column_names = ["app_version","status","running_time"]
      csv << column_names
      all.each do |detail_report|
        csv << detail_report.attributes.values_at(*column_names)
      end
    end
  end
end
