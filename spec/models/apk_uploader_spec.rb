# require 'spec_helper'
# require 'carrierwave/test/matchers'

# describe ApkUploader do
# 	include CarrierWave::Test::Matchers

# 	let(:user) {User.new(email: "foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")}
# 	let(:project) {user.projects.new(name: "First App")}
# 	let(:total_report) {project.total_reports.new(apk: "TodayBreaker.apk", test_datetime: "2013/03/03 3:00pm")}

# 	path_to_file = "#{Rails.root}/lib/test_apk_generator/TestAndroid.apk"

# 	before do
# 		@uploader = ApkUploader.new(total_report, :apk)
# 		@uploader.store!(File.open(path_to_file))
# 	end

# 	after do
# 		@uploader.remove!
# 	end

# 	it "uploader url check" do
# 		@uploader.to_s.should == "/uploads/total_report/apk/TestAndroid.apk"
# 	end

# end