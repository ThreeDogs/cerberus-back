require 'spec_helper'

describe "TestScenarios" do
	before do
		user = User.create!(email:"foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")

		project = user.projects.create!(name: "Test Android App")
		user.projects.create!(name: "KaKaoTalk")
		user.projects.create!(name: "Facebook")
		user.projects.create!(name: "What's app")

		total_report = project.total_reports.create!(test_datetime: "2013/03/03 3:00pm")
		project.total_reports.create!(test_datetime: "2013/03/03 3:00pm")
		project.total_reports.create!(test_datetime: "2013/03/03 3:00pm")
		project.total_reports.create!(test_datetime: "2013/03/03 3:00pm")

		detail_report = total_report.detail_reports.create!(app_version: "1.0", test_datetime: "2013/03/03 3:00pm", status: 0)


		test_scenario = project.test_scenarios.create!(name: "Login Test", description: "This is a Login Test", rank: 0)
	end

  describe "POST /api/v1/test_scenarios" do
  	it "create @test_scenario" do
  		# motion_events_json_array = '[{"seq_id":1,"time_stamp": "2014-02-20 16:33:41", "sleep": 1000, "activity_class": "MainActivity", "action_type": "Click","param": "parameter", "view": "R.id.button"},{"seq_id":1,"time_stamp": "2014-02-20 16:33:41", "sleep": 1000, "activity_class": "MainActivity", "action_type": "Click","param": "parameter", "view": "R.id.button"}]'

  		post "/api/v1/test_scenarios", project_id: 1
  		response.status.should be(201)
  		# response.body.should include("success_created")
  		# MotionEvent.all.size.should == 2
  	end

  	it "to_json test" do
  		20.times do
  			motion_events = []
  			motion_events << build(:motion_event)
  			motion_events.to_json.should include("MyString")
  		end
  	end
  end

  describe "POST /api/v1/motion_events" do
  end
end

