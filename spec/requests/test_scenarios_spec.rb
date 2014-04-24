require 'spec_helper'

describe "TestScenarios" do
  path_to_file = "#{Rails.root}/lib/test_apk_generator/TestAndroid.apk"
  test_path_to_file = "#{Rails.root}/lib/test_apk_generator/NewTestTestAndroid.apk"


  before do
    @user = User.create!(email: "foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")
    @project = @user.projects.create!(name: "First App")

    @apk = @project.apks.new
    @uploader = ApkUploader.new(@apk, :apk)
    @uploader.store!(File.open(path_to_file))
    @apk.apk = @uploader
    @apk.save!

    @test_scenario = @project.test_scenarios.create!(name: "Login Test", description: "This is a Login Test", rank: 0, project_id: @project.id)
  end

  after do
    @uploader.remove!
  end

  describe "GET /api/v1/test_scenarios/:id" do
    it "show @test_scenario" do
      get "/api/v1/test_scenarios/1", format: :json
      response.status.should be(200)
      response.body.should include("Login Test")
      response.body.should include("This is a Login Test")
    end
  end

  describe "POST /api/v1/test_scenarios" do
  	# it "create @test_scenario" do
  	# 	post "/api/v1/test_scenarios", project_id: 1
  	# 	response.status.should be(201)
  	# end
  end

  describe "POST /api/v1/motion_events" do
    it "create @motion_events" do
      motion_events_json_array = '[{"seq_id":1,"time_stamp": "2014-02-20 16:33:41", "sleep": 1000, "activity_class": "MainActivity", "action_type": "Click","param": "parameter", "view": "R.id.button"},{"seq_id":1,"time_stamp": "2014-02-20 16:33:41", "sleep": 1000, "activity_class": "MainActivity", "action_type": "Click","param": "parameter", "view": "R.id.button"}]'

      post "/api/v1/motion_events", test_scenario_id: 1, motion_events: motion_events_json_array
      response.status.should be(201)
      response.body.should include("success_created")
      MotionEvent.all.size.should == 2
    end

    it "to_json test" do
      20.times do
        motion_events = []
        motion_events << build(:motion_event)
        motion_events.to_json.should include("MyString")
      end
    end
  end
end

