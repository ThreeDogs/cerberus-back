# == Schema Information
#
# Table name: apks
#
#  id            :integer          not null, primary key
#  apk           :string(255)
#  test_apk      :string(255)
#  test_bed_apk  :string(255)
#  package_name  :string(255)
#  activity_name :string(255)
#  min_sdk       :string(255)
#  target_sdk    :string(255)
#  project_id    :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'
require 'carrierwave/test/matchers'

describe Apk do
	context "is validation check" do
		subject(:apk){Apk.new}
		it{should_not be_valid}
	end

	let(:user) {User.new(email: "foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")}
	let(:project) {user.projects.new(name: "First App")}

	path_to_file = "#{Rails.root}/lib/test_apk_generator/TestAndroid.apk"
	test_path_to_file = "#{Rails.root}/lib/test_apk_generator/NewTestTestAndroid.apk"

	before do
		@apk = project.apks.new
		@uploader = ApkUploader.new(@apk, :apk)
		@uploader.store!(File.open(path_to_file))
	end

	after do
		@uploader.remove!
	end

	it{@apk.should respond_to(:total_reports)}
	it{@apk.should respond_to(:project)}
	it{@apk.should respond_to(:apk)}
	it{@apk.should respond_to(:test_apk)}

	it "apk file name" do
		@apk.apk_name(path_to_file).should == "TestAndroid.apk"
		# @apk.test_apk_name(path_to_file).should == "NetTestTestAndroid.apk"
	end

	# it "uploader url check" do
	# 	@uploader.to_s.should == "/uploads/apk/apk/TestAndroid.apk"
	# end

 #  it "apk uploader script test" do
 #  	apk.generate_test_apk(@uploader.to_s).should == "/uploads/apk/test_apk//NewTestTestAndroid.apk"
 #  end
end
