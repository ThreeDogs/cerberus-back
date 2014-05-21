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

require 'spec_helper'

describe DetailReport do
	it "Report OverView" do
		@device = Device.create(model: "SamsungGalaxyNote3", os_version: "4.2", device_key: "abcd")

		@test_scenario = TestScenario.create(description: "This is a Login Test", rank: 0)

		@crash = Crash.create(error_name: "java.lang.NullPointerException (com.autoschedule.proto.c.a:-1)", description: "test description")

		@detail_report = @test_scenario.detail_reports.create(app_version: "1.0", status: 1, running_time: 660, device_key: "abcd", test_datetime: "14.MAR.05 17:00", crash_id: @crash.id)
		@detail_report.test_scenario_name.should include("TestScenario")
		@detail_report.app_version.should == "1.0"
		@detail_report.device_name.should == "SamsungGalaxyNote3"
		@detail_report.get_running_time.should == "660.0s"
		@detail_report.test_datetime.should == "14.MAR.05 17:00"
		@detail_report.get_status.should == "Pass"

		# implement
		@detail_report.memory_average.should == "20.00mb"
		@detail_report.cpu_average.should == "11%"
		@detail_report.network_average.should == "2394 kb/s"
		@detail_report.battery_consumption.should == "normal"
		@detail_report.threads_average.should == "34"
		@detail_report.frame_draw_time_average.should == "11.27ms"

		# Crash Test
		@detail_report.crash.error_name.should == "java.lang.NullPointerException (com.autoschedule.proto.c.a:-1)"
	end
end
