# == Schema Information
#
# Table name: total_reports
#
#  id            :integer          not null, primary key
#  status        :boolean          default(FALSE)
#  apk_id        :integer
#  project_id    :integer
#  deviceship_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'net/http'

class TotalReport < ActiveRecord::Base
  include AttributesReturn
  # after_create :create_deviceship

	default_scope { order('created_at DESC') } 
	scope :complete_total_reports, -> {where(status: true)}

  belongs_to :apk
  belongs_to :project

  has_many :crashes

  has_many :detail_reports

  has_many :scenarioships
  has_many :test_scenarios, through: :scenarioships

  has_many :codeships
  has_many :test_codes, through: :codeships

  has_many :devices

  def app_version   
    detail_reports.first.app_version unless detail_reports.empty?
  end

  def apk_name
    if apk
  	  apk.apk_name
    else
      "APK Error"
    end
  end

  def package_name
    apk.package_name
  end

  def activity_name
    apk.activity_name
  end

  def test_date
  	created_at.strftime("%y.%m.%d. %I:%M %p")
  end

  def number_of_scenarios
    test_scenarios.count
  end

  def number_of_devices
    devices.count
  end

  # Rank, Status, OS Version, Device, Name
  def test_names
    test_scenarios.collect{|t| t.name}
  end

  def device_names
    devices.collect{|d| d.model }
  end

  def number_of_details
    detail_reports.count
  end

  def test_progress
    (number_of_details * 1.0 / (number_of_devices * number_of_scenarios)) * 100
  end

  def device_fail_results
    results = []
    devices.each do |device|
      result = {}
      result["device_name"] = device.model
      result["os_version"] = device.os_version
      result["fail_data"] = device.fail_data
      results << result
    end
    results
  end

  def test_rank_status
    result = {}
    details = detail_reports
    if a = rank_result("A", details)
      result["A"] = a  
    end

    if b = rank_result("B", details)
      result["B"] = b
    end

    if c = rank_result("C", details)
      result["C"] = c
    end

    if d = rank_result("D", details)
      result["D"] = d
    end

    result
  end

  def rank_result(rank, details)
    rank_reports = details.select{|d| d.rank == rank}
    unless rank_reports.blank?
      [rank_reports.select{|d| d.status == 1}.length,# Pass Count
      rank_reports.select{|d| d.status == -1}.length] # Fail Count
    end
  end

  def get_device_list(test_bed_url = TEST_BED_URL)
    uri = URI("#{test_bed_url}/DeviceInfo")
    res = Net::HTTP.get(uri)
    res
  end

  def start_test(test_bed_url = TEST_BED_URL)
    apk_url = self.apk.test_bed_apk
    total_report_id = self.id
    test_scenario_motion_events = []
    test_codes_info = []

    self.test_scenarios.each do |t|
      test_scenario_motion_events << {"#{t.id}" => t.motion_events}
    end

    self.test_codes.each do |t|
      test_codes_info << {"#{t.id}" => t.import_code_file_name}
    end

    uri = URI("#{test_bed_url}/StartDevice")
    req = Net::HTTP::Post.new(uri, initheader = {'Content-Type' =>'application/json'})
    req.body = {apk_url: apk_url, total_report_id: total_report_id, test_scenarios_json: test_scenario_motion_events, test_codes_file: test_codes_info ,package_name: package_name, activity_name: activity_name}.to_json
    puts req.body
    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end

    puts res.is_a?(Net::HTTPSuccess) ? "Success" : "Error"
  end

  def create_deviceship
    device_list = JSON.parse(get_device_list)
    devices = device_list.collect { |device| self.devices.build(device) }
    Device.import devices
  end
end
