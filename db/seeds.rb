# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


user = User.create(email:"foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")

project = users.projects.create(name: "Test Android App")
# users.projects.create(name: "KaKaoTalk")
# users.projects.create(name: "Facebook")
# users.projects.create(name: "What's app")

report = projects.reports.create(package_name: "com.android.sample", icon: "/icon.png", app_version: "1.0", os_version: "4.1", device_name: "SHEV-401", country: "KR", time_for_test: 999.99)





