# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.create(email:"foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")

project = user.projects.create(name: "Test Android App")
user.projects.create(name: "KaKaoTalk")
user.projects.create(name: "Facebook")
user.projects.create(name: "What's app")

total_report = project.total_reports.create(apk: "TodayBreaker.apk", test_datetime: "2013/03/03 3:00pm")
project.total_reports.create(apk: "TodayBreaker.apk", test_datetime: "2013/03/03 3:00pm")
project.total_reports.create(apk: "TodayBreaker.apk", test_datetime: "2013/03/03 3:00pm")
project.total_reports.create(apk: "TodayBreaker.apk", test_datetime: "2013/03/03 3:00pm")

detail_report = total_report.detail_reports.create(app_version: "1.0", test_datetime: "2013/03/03 3:00pm", status: 0)


test_scenario = project.test_scenarios.create(name: "Login Test", description: "This is a Login Test", rank: 0)



