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
  after_create :start_test
	default_scope { order('created_at DESC') } 
	scope :complete_total_reports, -> {where(status: true)}

  belongs_to :apk
  belongs_to :project
  has_many :detail_reports

  # validates :test_datetime, presence: true
  def apk_name
  	apk.apk_name
  end

  def test_date
  	created_at.strftime("%y.%m.%d. %I:%M %p")
  end

  def number_of_scenarios
    # implement
    112
  end

  def number_of_devices
    # implement
    10
  end

  def test_rank_status
    # implement
    {A:[17,7],B:[23,34], C:[10,5], D:[19,2]}
  end

  def start_test(test_bed_url = "http://172.16.101.175:9000")
    apk_url = self.apk.apk.to_s
    total_report_id = self.id
    test_scenarios = project.test_scenarios
    test_scenario_ids = []

    test_scenarios.each do |t|
      test_scenario_ids << t.id      
    end

    uri = URI("#{test_bed_url}/apk_info_send")
    req = Net::HTTP::Post.new(uri, initheader = {'Content-Type' =>'application/json'})
    req.body = {apk_url: apk_url, total_report_id: total_report_id, test_scenario_ids: test_scenario_ids}.to_json
    res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
    end

    puts res.is_a?(Net::HTTPSuccess) ? "Success" : "Error"
  end

end
