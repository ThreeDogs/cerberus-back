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

	path_to_file = "#{Rails.root}/lib/test_apk_generator/TestAndroid.apk"
	test_path_to_file = "#{Rails.root}/lib/test_apk_generator/NewTestTestAndroid.apk"


	before do
		@user = User.create(email: "foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")
		@project = @user.projects.create(name: "First App")

		@apk = project.apks.new
		@uploader = ApkUploader.new(@apk, :apk)
		@uploader.store!(File.open(path_to_file))

		@total_reports = []
		@total_reports << @apk.total_reports.create(status: true)
	end

	
 #  subject(:project) {user.projects.new(name: "First App")}
 #  let(:apk) {project.apks.new}
	# let(:total_report) {apk.total_reports.new(status: true, project_id: project.id)}
	# let(:total_report) {apk.total_reports.new(status: true, project_id: project.id)}
	# let(:total_report) {apk.total_reports.new(status: true, project_id: project.id)}
	# let(:total_report) {apk.total_reports.new(status: true, project_id: project.id)}
	# let(:total_report) {apk.total_reports.new(project_id: project.id)}
	# let(:total_report) {apk.total_reports.new(project_id: project.id)}
	# let(:total_report) {apk.total_reports.new(project_id: project.id)}

  # it{should respond_to(:user)} # belongs_to user
  # it{should respond_to(:apks)}
  # it{should respond_to(:total_reports)}
  # it{should respond_to(:test_scenarios)}
  # it{should respond_to(:name)}

  # describe "RecentTestOverView" do
  # it "status test sort" do
  	# project.apks.size.should == 0
  # end
  
end

describe User do
	subject(:user) {User.new(email: "foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")}
	it{should respond_to(:email)}
	it{should respond_to(:password)}
	it{should respond_to(:projects)}
end
