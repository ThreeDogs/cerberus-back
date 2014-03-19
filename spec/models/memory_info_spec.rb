# == Schema Information
#
# Table name: memory_infos
#
#  id              :integer          not null, primary key
#  dalvik_size     :integer
#  dalvik_alloc    :integer
#  native_size     :integer
#  native_alloc    :integer
#  motion_event_id :integer
#  report_id       :integer
#  created_at      :datetime
#  updated_at      :datetime
#

require 'spec_helper'

describe MemoryInfo do
	context "is validation check" do
		subject(:memory_info){MemoryInfo.new}
		it{should_not be_valid}
	end

	let(:user) {User.new(email: "foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")}
	let(:project) {user.projects.new(name: "First App")}
	let(:report) {project.reports.new(package_name: "com.android.proto", icon: "/rails.png", app_version: "1.0", os_version: "4.1", time_for_test: 6000)}
	let(:motion_event){report.motion_events.new(seq_id: 1, time_stamp: 1392748570878, sleep: 6000, activity_class: "com.autoschedule.proto.index.TaskNewDateActivity", action_type: "Click", param: "", view: "nextmenu_btn")}

	subject(:memory_info){report.memory_infos.new(dalvik_size: 10248, dalvik_alloc: 6153, native_size: 6404, native_alloc: 6352, motion_event_id: motion_event.id)}

	it{should respond_to(:report)}
	it{should respond_to(:motion_event)}
end