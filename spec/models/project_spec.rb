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
		@user = User.create!(email: "foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")
		@project = @user.projects.create!(name: "First App")

		@apk = project.apks.new
		@uploader = ApkUploader.new(@apk, :apk)
		@uploader.store!(File.open(path_to_file))
		@apk.apk = @uploader
		@apk.save!

		(1..10).each do |i|
			if i % 2 == 0			
				@apk.total_reports.create(status: true, created_at: i.minutes.ago, project_id: @project.id)
			else
				@apk.total_reports.create(created_at: i.minutes.ago, project_id: @project.id)
			end
		end
		@apk.total_reports.create(status: true, created_at: 1.seconds.ago, project_id: @project.id, test_datetime: "recent")
	end

	after do
		@uploader.remove!
	end

	subject(:project){@project}

  it{should respond_to(:user)} # belongs_to user
  it{should respond_to(:apks)}
  it{should respond_to(:total_reports)}
  it{should respond_to(:test_scenarios)}
  it{should respond_to(:name)}

  describe "RecentTestOverView" do
	  it "complete_total_reports" do
	  	project.total_reports.size.should == 11
	  	project.complete_total_reports.size.should == 6
	  end

	  it "recent_total_report" do
	  	recent_report = project.recent_total_report
	  	recent_report.test_datetime.should == "recent"
	  	recent_report.apk_name.should == "TestAndroid.apk"
	  end
	end
end

describe User do
	subject(:user) {User.new(email: "foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")}
	it{should respond_to(:email)}
	it{should respond_to(:password)}
	it{should respond_to(:projects)}
end
