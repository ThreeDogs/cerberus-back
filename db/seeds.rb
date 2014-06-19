# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# path_to_file = "#{Rails.root}/lib/test_apk_generator/TestAndroid.apk"
# test_path_to_file = "#{Rails.root}/lib/test_apk_generator/NewTestTestAndroid.apk"

@user = User.create!(email: "admin@appxcellent.com", password: "foobarfoo", password_confirmation: "foobarfoo")

Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }

# @today_project = @user.projects.create!(name: "Today Breaker", icon: "/assets/todaybreaker.png")
# @bitmap_project = @user.projects.create!(name: "Bitmap Fun", icon: "")

# # real apk upload
# (1..5).each do |i|
#     @vingle_project.apks.create!(apk: "com.vingle.android.apk" ,test_apk: "test_com.vingle.android.apk",test_bed_apk:"test_bed_com.vingle.android.apk", package_name: "com.vingle.android" , activity_name: "com.vingle.application.splash.VingleSplashActivity" ,min_sdk:8, target_sdk:19, created_at: i.weeks.ago)
# end

# (1..5).each do |i|
#     @today_project.apks.create!(apk: "AutoScheduleProject.apk" ,test_apk: "test_AutoScheduleProject.apk",test_bed_apk:"test_bed_AutoScheduleProject.apk", package_name: "com.autoschedule.proto" , activity_name: "com.autoschedule.proto.SplashActivity",min_sdk: 10, target_sdk: 17, created_at: i.weeks.ago)
# end

# (1..2).each do |i|
#     @bitmap_project.apks.create!(apk: "BitmapFunNoCache.apk" ,test_apk: "test_AutoScheduleProject.apk",test_bed_apk:"test_bed_AutoScheduleProject.apk", package_name: "com.example.android.bitmapfun", activity_name: "com.example.android.bitmapfun.ui.ImageGridActivity" ,min_sdk:7, target_sdk: 19, created_at: i.weeks.ago)
# end

# (1..3).each do |j|
#   (1..5).each do |i|
#     TotalReport.create!(status: true, created_at: 3.months.ago, project_id: j, apk_id:i)
#     TotalReport.create!(status: true, created_at: 2.months.ago, project_id: j, apk_id:i)
#     TotalReport.create!(status: true, created_at: 1.months.ago, project_id: j, apk_id:i)
#     TotalReport.create!(status: true, created_at: 3.weeks.ago, project_id: j, apk_id:i)
#     TotalReport.create!(status: true, created_at: 2.weeks.ago, project_id: j, apk_id:i)
#     TotalReport.create!(status: true, created_at: 1.weeks.ago, project_id: j, apk_id:i)
#     TotalReport.create!(status: true, created_at: 6.days.ago, project_id: j, apk_id:i)
#     TotalReport.create!(status: true, created_at: 5.days.ago, project_id: j, apk_id:i)
#     TotalReport.create!(status: true, created_at: 4.days.ago, project_id: j, apk_id:i)
#     TotalReport.create!(status: true, created_at: 1.days.ago, project_id: j, apk_id:i)
#   end
# end

# # Vingle Test Scenario
# @login_test = @vingle_project.test_scenarios.create!(name: "Login Test", description: "", rank: 0)
# @login_test.motion_events.create!(
# activity_class: 'com.vingle.android.SplashActivity',
# param:  '',
# view: 'sign_in',
# sleep: null,
# action_type: 'Click',
# client_timestamp: 1403157161256
# )
# @login_test.motion_events.create!(
# activity_class: 'com.vingle.android.loginActivity',
# param:  '',
# view: 'username',
# sleep: 1766,
# action_type: 'Click',
# client_timestamp: 1403157163022
# )

# @login_test.motion_events.create!(
# activity_class: 'com.vingle.android.loginActivity',
# param:  'shtjdgus1090@gmail.com',
# view: 'username',
# sleep: 600,
# action_type: 'EditText',
# client_timestamp: 1403157165646
# )

# @login_test.motion_events.create!(
# activity_class: 'com.vingle.android.loginActivity',
# param:  'asdf1090',
# view: 'password',
# sleep: 600,
# action_type: 'EditText',
# client_timestamp: 1403157169667
# )

# @login_test.motion_events.create!(
# activity_class: 'com.vingle.android.loginActivity',
# param:  '',
# view: 'signin',
# sleep: 1947,
# action_type: 'Click',
# client_timestamp: 1403157175295
# )

# @login_test.motion_events.create!(
# activity_class: 'com.vingle.android.grid.common.AbsGridFragment',
# param:  '-2',
# view: 'signin',
# sleep: 1947,
# action_type: 'AlertDialogClick',
# client_timestamp: 1403157180030
# )

# @list_test = @vingle_project.test_scenarios.create!(name: "Basic ListView Test", description: "", rank: 0)
# @button_test = @vingle_project.test_scenarios.create!(name: "List Custom Button List Test", description: "", rank: 1)
# @collection_test = @vingle_project.test_scenarios.create!(name: "Collection Test", description: "", rank: 2)
# @interest_test = @vingle_project.test_scenarios.create!(name: "Interest Test", description: "", rank: 3)


# # Vingle Total Report
# @vingle_project.total_reports.each do |total_report|
#     a_device = total_report.devices.create!(brand: "samsung",cpu: "armeabi-v7a",model: "SM_N900S",os_version: "4.3",country: "KR")
#     b_device = total_report.devices.create!(brand: "samsung",cpu: "armeabi-v7a",model: "SHV-E250S",os_version: "4.1",country: "KR")
#     c_device = total_report.devices.create!(brand: "google",cpu: "armeabi-v7a",model: "Nexus7",os_version: "4.3",country: "KR")
#     d_device = total_report.devices.create!(brand: "samsung",cpu: "armeabi-v7a",model: "SHW-M130K",os_version:"2.1",country:"KR")
#     e_device = total_report.devices.create!(brand: "samsung",cpu: "armeabi-v7a",model:"SHW-M130L",os_version: "4.0",country: "KR")
#     f_device = total_report.devices.create!(brand: "samsung",cpu: "armeabi-v7a",model: "SGH-I897",os_version:"4.2",country: "KR")
# end

# @today_project.total_reports.each do |total_report|
#     total_report.devices.create!(brand: "samsung",cpu: "armeabi-v7a",model: "SM_N900S",os_version: "4.3",country: "KR")
#     total_report.devices.create!(brand: "samsung",cpu: "armeabi-v7a",model: "SHV-E250S",os_version: "4.1",country: "KR")
#     total_report.devices.create!(brand: "google",cpu: "armeabi-v7a",model: "Nexus7",os_version: "4.3",country: "KR")
#     total_report.devices.create!(brand: "samsung",cpu: "armeabi-v7a",model: "SHW-M130K",os_version:"2.1",country:"KR")
#     total_report.devices.create!(brand: "samsung",cpu: "armeabi-v7a",model:"SHW-M130L",os_version: "4.0",country: "KR")
#     total_report.devices.create!(brand: "samsung",cpu: "armeabi-v7a",model: "SGH-I897",os_version:"4.2",country: "KR")
# end

# @bitmap_project.total_reports.each do |total_report|
#     total_report.devices.create!(brand: "samsung",cpu: "armeabi-v7a",model: "SM_N900S",os_version: "4.3",country: "KR")
#     total_report.devices.create!(brand: "samsung",cpu: "armeabi-v7a",model: "SHV-E250S",os_version: "4.1",country: "KR")
# end

# # 10.times do
# #      a.motion_events.create!(activity_class: 'asd',
# #              param:  '123',
# #              view: 'view',
# #              sleep: 3000,
# #              action_type: 'Click',client_timestamp: 1237)
# # end

# # @total_report.scenarioships.create!(test_scenario_id: a.id)
# # @total_report.scenarioships.create!(test_scenario_id: b.id)
# # @total_report.scenarioships.create!(test_scenario_id: c.id)
# # @total_report.scenarioships.create!(test_scenario_id: d.id)

# # @total_report.devices.create(brand: "Samsung", cpu: "ARM", model:"Galaxy", os_version: "4.3", country: "KR", device_key: "A2BVDWE")
# # @total_report.devices.create(brand: "LG", cpu: "ARM", model:"G2", os_version: "4.4", country: "KR", device_key: "A3BVDWE")
# # @total_report.devices.create(brand: "Nokia", cpu: "ARM", model:"Nokia", os_version: "4.0", country: "EN", device_key: "A4BVDWE")
# # @total_report.devices.create(brand: "Xaomi", cpu: "ARM", model:"XaomiXXX", os_version: "4.1", country: "CN", device_key: "A5BVDWE")
# # @total_report.devices.create(brand: "Google", cpu: "ARM", model:"GogolPhone", os_version: "2.3", country: "KR", device_key: "A6BVDWE")

# # crash_1 = @total_report.crashes.create!(error_name: "Out Of Memory", error_line: "android.widget.Browsasd.webkit(234)")
# # crash_2 = @total_report.crashes.create!(error_name: "Just Fuck Error", error_line: "android.widget.Browsasd.webkit(234)")
# # crash_3 = @total_report.crashes.create!(error_name: "What the fuck Error", error_line: "android.widget.Browsasd.webkit(234)")
# # crash_4 = @total_report.crashes.create!(error_name: "Error", error_line: "android.widget.Browsasd.webkit(234)")
# # crash_5 = @total_report.crashes.create!(error_name: "NullPointerException", error_line: "android.widget.Browsasd.webkit(234)")


# # (2..6).each do |i|
# # @total_report.detail_reports.create!(crash_id: crash_1.id,app_version: "1.0", status: -1, running_time: 1200, test_scenario_id: a.id, device_key: "A#{i}BVDWE")
# # @total_report.detail_reports.create!(crash_id: crash_1.id,app_version: "1.0", status: -1, running_time: 1200, test_scenario_id: a.id, device_key: "A#{i}BVDWE")
# # @total_report.detail_reports.create!(crash_id: crash_2.id,app_version: "1.0", status: -1, running_time: 1200, test_scenario_id: a.id, device_key: "A#{i}BVDWE")
# # @total_report.detail_reports.create!(crash_id: crash_3.id,app_version: "1.0", status: -1, running_time: 1200, test_scenario_id: b.id, device_key: "A#{i}BVDWE")
# # @total_report.detail_reports.create!(crash_id: crash_4.id,app_version: "1.0", status: -1, running_time: 1200, test_scenario_id: b.id, device_key: "A#{i}BVDWE")
# # @total_report.detail_reports.create!(crash_id: crash_5.id,app_version: "1.0", status: -1, running_time: 1200, test_scenario_id: b.id, device_key: "A#{i}BVDWE")
# # @total_report.detail_reports.create!(crash_id: crash_1.id,app_version: "1.0", status: -1, running_time: 1200, test_scenario_id: c.id, device_key: "A#{i}BVDWE")
# # @total_report.detail_reports.create!(crash_id: crash_2.id,app_version: "1.0", status: -1, running_time: 1200, test_scenario_id: c.id, device_key: "A#{i}BVDWE")
# # @total_report.detail_reports.create!(crash_id: crash_4.id,app_version: "1.0", status: -1, running_time: 1200, test_scenario_id: d.id, device_key: "A#{i}BVDWE")
# # @total_report.detail_reports.create!(crash_id: crash_5.id,app_version: "1.0", status: -1, running_time: 1200, test_scenario_id: d.id, device_key: "A#{i}BVDWE")
# # end

# # @total_report.detail_reports.create!(crash_id: crash_5.id,app_version: "1.0", status: -1, running_time: 1200, test_scenario_id: d.id, device_key: "A2BVDWE")

# # DetailReport.all.each do |d|
# #   d.memory_infos.create!(
# #           mem_total: 10,
# #           dalvik_heap_alloc: 10,
# #           native_heap_size: 10,
# #           mem_alloc: 10,
# #           dalvik_heap_size: 10,
# #           native_heap_alloc: 10,
# #           client_timestamp: 1234
# #       )

# # d.memory_infos.create!(
# #           mem_total: 10,
# #           dalvik_heap_alloc: 10,
# #           native_heap_size: 10,
# #           mem_alloc: 10,
# #           dalvik_heap_size: 10,
# #           native_heap_alloc: 10,
# #           client_timestamp: 1235
# #       )

# # d.cpu_infos.create!(usage: 10,client_timestamp: 1234)
# # d.cpu_infos.create!(usage: 20,client_timestamp: 1235)
# # d.cpu_infos.create!(usage: 30,client_timestamp: 1236)

# # d.motion_event_infos.create!(activity_class: 'asd',
# #           param:  '123',
# #           view: 'view',
# #           sleep: 3000,
# #           action_type: 'Click',client_timestamp: 1234)

# # d.motion_event_infos.create!(activity_class: 'asd',
# #           param:  '123',
# #           view: 'view',
# #           sleep: 3000,
# #           action_type: 'Click',client_timestamp: 1237)
# # end


