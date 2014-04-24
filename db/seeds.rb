# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

path_to_file = "#{Rails.root}/lib/test_apk_generator/TestAndroid.apk"
test_path_to_file = "#{Rails.root}/lib/test_apk_generator/NewTestTestAndroid.apk"

@user = User.create!(email: "foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")
@project = @user.projects.create!(name: "First App")

@apk = @project.apks.new
@uploader = ApkUploader.new(@apk, :apk)
@uploader.store!(File.open(path_to_file))
@apk.apk = @uploader
@apk.project_id = @project.id
@apk.save!

(1..10).each do |i|
	if i % 2 == 0			
		@apk.total_reports.create(status: true, created_at: i.minutes.ago, project_id: 1, app_version: "1.0")
	else
		@apk.total_reports.create(created_at: i.minutes.ago, project_id: 1, app_version: "1.0")
	end
end
@total_report = @apk.total_reports.create(status: true, created_at: 1.seconds.ago, project_id: 1, test_datetime: "recent", app_version: "1.0")

@detail_report = @total_report.detail_reports.create!(app_version: "1.0", test_datetime: "2013/03/03 3:00pm", status: 0)

@test_scenario = @project.test_scenarios.create!(name: "Login Test", description: "This is a Login Test", rank: 0)



