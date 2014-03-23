# == Schema Information
#
# Table name: total_reports
#
#  id            :integer          not null, primary key
#  apk           :string(255)
#  test_apk      :string(255)
#  test_datetime :string(255)
#  project_id    :integer
#  deviceship_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'
require 'carrierwave/test/matchers'

describe TotalReport do
 #  context "is validation check" do
	# 	subject(:total_report){TotalReport.new}
	# 	it{should_not be_valid}
	# end

	let(:user) {User.create!(email: "foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")}
	let(:project) {user.projects.create!(name: "First App")}
	subject(:total_report) {project.total_reports.create!}

	path_to_file = "#{Rails.root}/lib/test_apk_generator/TestAndroid.apk"

	before do
		@uploader = ApkUploader.new(total_report, :apk)
		@uploader.store!(File.open(path_to_file))
	end

	after do
		@uploader.remove!
	end

	it{should respond_to(:apk)}
	it{should respond_to(:test_apk)}
  it{should respond_to(:project)}
  it{should respond_to(:detail_reports)}

  it "uploader url check" do
		@uploader.to_s.should == "/uploads/total_report/apk/1/TestAndroid.apk"
	end

  it "apk uploader script test" do
  	total_report.generate_test_apk(@uploader.to_s).should == "/uploads/total_report/test_apk/1/NewTestTestAndroid.apk"
  end
end


describe DetailReport do
  context "is validation check" do
		subject(:detail_report){DetailReport.new}
		it{should_not be_valid}
	end

	let(:user) {User.new(email: "foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")}
	let(:project) {user.projects.new(name: "First App")}
	let(:total_report) {project.total_reports.new(apk: "TodayBreaker.apk", test_datetime: "2013/03/03 3:00pm")}
	subject(:detail_report){total_report.detail_reports.new(app_version: "1.0", test_datetime: "2013/03/03 3:00pm", status: 0)}

	it{should respond_to(:test_scenario)}
	it{should respond_to(:total_report)} 
end
