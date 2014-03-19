# == Schema Information
#
# Table name: cpu_infos
#
#  id              :integer          not null, primary key
#  cpu_usage       :integer
#  motion_event_id :integer
#  report_id       :integer
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe CpuInfo do
	context "is validation check" do
		subject(:cpu_info){CpuInfo.new}
		it{should_not be_valid}
	end


	let(:user) {User.new(email: "foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")}
	let(:project) {user.projects.new(name: "First App")}
	let(:report) {project.reports.new(package_name: "com.android.proto", icon: "/rails.png", app_version: "1.0", os_version: "4.1", time_for_test: 6000)}
	let(:motion_event){report.motion_events.new(seq_id: 1, time_stamp: 1392748570878, sleep: 6000, activity_class: "com.autoschedule.proto.index.TaskNewDateActivity", action_type: "Click", param: "", view: "nextmenu_btn")}

	subject(:cpu_info){report.cpu_infos.new(cpu_usage: 10248, motion_event_id: motion_event.id)}

	it{should respond_to(:report)}
	it{should respond_to(:motion_event)}
end