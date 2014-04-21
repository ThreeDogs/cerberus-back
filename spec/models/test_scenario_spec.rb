# == Schema Information
#
# Table name: test_scenarios
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  description     :string(255)
#  rank            :integer
#  project_id      :integer
#  scenarioship_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe TestScenario do
  context "is validation check" do
		subject(:test_scenarios){TestScenario.new}
		it{should_not be_valid}
	end

	let(:user) {User.new(email: "foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")}
	let(:project) {user.projects.new(name: "First App")}
	subject(:test_scenario) {project.test_scenarios.new(name: "Login Test", description: "This is a Login Test", rank: 0)}

  it{should respond_to(:project)}
  it{should respond_to(:motion_events)}
  it{should respond_to(:detail_reports)}

  it "#index" do
  	test_scenario.name.should == "Login Test"
  	test_scenario.description.should == "This is a Login Test"
  	test_scenario.get_rank.should == "A"
  	test_scenario.recent_test_date == "14.MAR.03 3:00pm"
  end
end

describe MotionEvent do
	context "is validation check"	do
		subject(:motion_events){MotionEvent.new}
		it{should_not be_valid}
	end

	let(:user) {User.new(email: "foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")}
	let(:project) {user.projects.new(name: "First App")}
	let(:test_scenario) {project.test_scenarios.new(name: "Login Test", description: "This is a Login Test", rank: 0)}
	subject(:motion_event){test_scenario.motion_events.new(seq_id: 1, time_stamp: 1392748570878, sleep: 6000, activity_class: "com.autoschedule.proto.index.TaskNewDateActivity", action_type: "Click", param: "", view: "nextmenu_btn")}

	it{should respond_to(:test_scenario)}
end