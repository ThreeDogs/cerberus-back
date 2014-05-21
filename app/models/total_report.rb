# == Schema Information
#
# Table name: total_reports
#
#  id            :integer          not null, primary key
#  test_datetime :string(255)
#  app_version   :string(255)
#  status        :boolean          default(FALSE)
#  apk_id        :integer
#  project_id    :integer
#  deviceship_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#
require 'net/http'

class TotalReport < ActiveRecord::Base
  # after_create :start_test
  # after_create :create_scenarioship
  # after_create :create_deviceship

	default_scope { order('created_at DESC') } 
	scope :complete_total_reports, -> {where(status: true)}

  belongs_to :apk
  belongs_to :project

  has_many :crashes

  has_many :detail_reports

  has_many :scenarioships
  has_many :test_scenarios, through: :scenarioships

  has_many :devices

  # has_many :deviceships
  # has_many :devices, through: :deviceships

  # accepts_nested_attributes_for :scenarioships, allow_destroy: true

  # validates :test_datetime, presence: true
  def apk_name
  	apk.apk_name
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

  def number_of_details
    detail_reports.count
  end

  def test_progress
    (number_of_details * 1.0 / (number_of_devices * number_of_scenarios)) * 100
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
      rank_reports.select{|d| d.status == 0}.length] # Fail Count
    end
  end

  def get_device_list(test_bed_url = TEST_BED_URL)
    uri = URI("#{test_bed_url}/DeviceInfo")
    res = Net::HTTP.get(uri)
    res
  end

  private

  def start_test(test_bed_url = TEST_BED_URL)
    apk_url = self.apk.test_bed_apk
    total_report_id = self.id
    test_scenario_motion_events = []
    test_scenarios = project.test_scenarios
    test_scenarios.each do |t|
      test_scenario_motion_events << {"#{t.id}" => t.motion_events}
    end

    uri = URI("#{test_bed_url}/StartDevice")
    req = Net::HTTP::Post.new(uri, initheader = {'Content-Type' =>'application/json'})
    req.body = {apk_url: apk_url, total_report_id: total_report_id, test_scenarios: test_scenario_motion_events, package_name: package_name, activity_name: activity_name}.to_json
    puts req.body
    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end

    puts res.is_a?(Net::HTTPSuccess) ? "Success" : "Error"
  end

  def create_scenarioship
    scenarioships_builds = project.test_scenarios.collect do |test_scenario|
      Scenarioship.new(test_scenario_id: test_scenario.id, total_report_id: self.id)
    end

    Scenarioship.import scenarioships_builds
  end

  def create_deviceship
    device_list = JSON.parse(get_device_list)

    devices = device_list.collect do |device| 
      self.devices.build(device)
    end
    Device.import devices
  end
end
