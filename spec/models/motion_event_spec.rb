# == Schema Information
#
# Table name: motion_events
#
#  id             :integer          not null, primary key
#  seq_id         :integer
#  time_stamp     :datetime
#  sleep          :integer
#  activity_class :string(255)
#  action_type    :string(255)
#  param          :string(255)
#  view           :string(255)
#  report_id      :integer
#  created_at     :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe MotionEvent do
	context "is validation check" do
		subject(:motion_event){MotionEvent.new}
		it{should_not be_valid}
	end

	let(:user) {User.new(email: "foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")}
	let(:project) {user.projects.new(name: "First App")}
	let(:report) {project.reports.new(package_name: "com.android.proto", icon: "/rails.png", app_version: "1.0", os_version: "4.1", time_for_test: 6000)}

	subject(:motion_event){report.motion_events.new(seq_id: 1, time_stamp: 1392748570878, sleep: 6000, activity_class: "com.autoschedule.proto.index.TaskNewDateActivity", action_type: "Click", param: "", view: "nextmenu_btn")}

	it{should respond_to(:report)}
	it{should respond_to(:memory_info)}
	it{should respond_to(:cpu_info)}
end
