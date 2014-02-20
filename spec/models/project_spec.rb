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

describe Report do
	context "is validation check" do
		subject(:report){Report.new}
		it{should_not be_valid}

		let(:user) {User.new(email: "foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")}
  	let(:project) {user.projects.new(name: "First App")}
  	subject(:report) {project.reports.new(package_name: "com.android.proto", icon: "/rails.png", app_version: "1.0", os_version: "4.1", time_for_test: 6000)}

  	it{should respond_to(:project)}
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
