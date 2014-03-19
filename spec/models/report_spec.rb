# == Schema Information
#
# Table name: reports
#
#  id            :integer          not null, primary key
#  package_name  :string(255)
#  icon          :string(255)
#  app_version   :string(255)
#  os_version    :string(255)
#  device_name   :string(255)
#  country       :string(255)
#  time_for_test :decimal(, )
#  project_id    :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

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
