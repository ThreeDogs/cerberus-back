# == Schema Information
#
# Table name: total_reports
#
#  id            :integer          not null, primary key
#  test_datetime :string(255)
#  app_version   :string(255)
#  status        :boolean          default(FALSE)
#  apk_id        :integer
#  project_id    :integer
#  deviceship_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe TotalReport do
	path_to_file = "#{Rails.root}/lib/test_apk_generator/TestAndroid.apk"
	test_path_to_file = "#{Rails.root}/lib/test_apk_generator/NewTestTestAndroid.apk"

	before do
		@apk = Apk.new
		@uploader = ApkUploader.new(@apk, :apk)
		@uploader.store!(File.open(path_to_file))
		@apk.apk = @uploader
		@apk.save!

		@total_report = @apk.total_reports.create!(app_version: "1.0", status: true)

		10.times do 
			@total_report.devices.create!(brand: "samsung", cpu:"123-core", model:"Galaxy",os_version:"4.2", country: "KR",device_key: "p1po2")
		end
	end

	after do
		@uploader.remove!
	end

	subject(:total_report){@total_report}

	it "total_report show" do
		total_report.apk_name.should == "TestAndroid.apk"
		total_report.test_date.should include("14.")
		total_report.number_of_devices.should == 10
		# total_report.number_of_scenarios.should == 112
	end

end
