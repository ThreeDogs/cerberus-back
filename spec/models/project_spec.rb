# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Project do
	context "is validation check" do
		subject(:project){Project.new}
		it{should_not be_valid}
	end

	let(:user) {User.new(email: "foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")}
  subject(:project) {user.projects.new(name: "First App")}

  it{should respond_to(:user)} # belongs_to user
  it{should respond_to(:reports)}
  it{should respond_to(:name)}
end

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

describe Report do
	context "is validation check" do
		subject(:report){Report.new}
		it{should_not be_valid}


		let(:user) {User.new(email: "foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")}
  	let(:project) {user.projects.new(name: "First App")}
  	subject(:report) {project.reports.new(package_name: "com.android.proto", icon: "/rails.png", app_version: "1.0", os_version: "4.1", time_for_test: 6000)}

  	it{should respond_to(:project)}
  	it{should respond_to(:motion_events)}
  	it{should respond_to(:memory_infos)}
  	it{should respond_to(:cpu_infos)}

  	it{should respond_to(:package_name)}
  	it{should respond_to(:icon)}
  	it{should respond_to(:app_version)}
  	it{should respond_to(:os_version)}
  	it{should respond_to(:time_for_test)}
  	it{should respond_to(:device_name)}
  	it{should respond_to(:country)}
	end
end

describe User do
	subject(:user) {User.new(email: "foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")}
	it{should respond_to(:email)}
	it{should respond_to(:password)}
	it{should respond_to(:projects)}
end
