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

@apk = @project.apks.create
@uploader = ApkUploader.new(@apk, :apk)
@uploader.store!(File.open(path_to_file))
@apk.apk = @uploader
@apk.project_id = @project.id
@apk.save!

@total_report = @apk.total_reports.create!(status: true, created_at: 1.seconds.ago, project_id: 1)

a = TestScenario.create!(description: "This is a Login Test", rank: 0, project_id: @project.id)
b = TestScenario.create!(description: "This is a Login Test", rank: 1, project_id: @project.id)
c = TestScenario.create!(description: "This is a Login Test", rank: 2, project_id: @project.id)
d = TestScenario.create!(description: "This is a Login Test", rank: 3, project_id: @project.id)

10.times do
     a.motion_events.create!(activity_class: 'asd',
             param:  '123',
             view: 'view',
             sleep: 3000,
             action_type: 'Click',client_timestamp: 1237)
end

@total_report.scenarioships.create!(test_scenario_id: a.id)
@total_report.scenarioships.create!(test_scenario_id: b.id)
@total_report.scenarioships.create!(test_scenario_id: c.id)
@total_report.scenarioships.create!(test_scenario_id: d.id)

@total_report.devices.create(brand: "Samsung", cpu: "ARM", model:"Galaxy", os_version: "4.3", country: "KR", device_key: "A2BVDWE")
@total_report.devices.create(brand: "LG", cpu: "ARM", model:"G2", os_version: "4.4", country: "KR", device_key: "A3BVDWE")
@total_report.devices.create(brand: "Nokia", cpu: "ARM", model:"Nokia", os_version: "4.0", country: "EN", device_key: "A4BVDWE")
@total_report.devices.create(brand: "Xaomi", cpu: "ARM", model:"XaomiXXX", os_version: "4.1", country: "CN", device_key: "A5BVDWE")
@total_report.devices.create(brand: "Google", cpu: "ARM", model:"GogolPhone", os_version: "2.3", country: "KR", device_key: "A6BVDWE")

crash_1 = @total_report.crashes.create!(error_name: "Out Of Memory", error_line: "android.widget.Browsasd.webkit(234)")
crash_2 = @total_report.crashes.create!(error_name: "Just Fuck Error", error_line: "android.widget.Browsasd.webkit(234)")
crash_3 = @total_report.crashes.create!(error_name: "What the fuck Error", error_line: "android.widget.Browsasd.webkit(234)")
crash_4 = @total_report.crashes.create!(error_name: "Error", error_line: "android.widget.Browsasd.webkit(234)")
crash_5 = @total_report.crashes.create!(error_name: "NullPointerException", error_line: "android.widget.Browsasd.webkit(234)")


(2..6).each do |i|
@total_report.detail_reports.create!(crash_id: crash_1.id,app_version: "1.0", status: -1, running_time: 1200, test_scenario_id: a.id, device_key: "A#{i}BVDWE")
@total_report.detail_reports.create!(crash_id: crash_1.id,app_version: "1.0", status: -1, running_time: 1200, test_scenario_id: a.id, device_key: "A#{i}BVDWE")
@total_report.detail_reports.create!(crash_id: crash_2.id,app_version: "1.0", status: -1, running_time: 1200, test_scenario_id: a.id, device_key: "A#{i}BVDWE")
@total_report.detail_reports.create!(crash_id: crash_3.id,app_version: "1.0", status: -1, running_time: 1200, test_scenario_id: b.id, device_key: "A#{i}BVDWE")
@total_report.detail_reports.create!(crash_id: crash_4.id,app_version: "1.0", status: -1, running_time: 1200, test_scenario_id: b.id, device_key: "A#{i}BVDWE")
@total_report.detail_reports.create!(crash_id: crash_5.id,app_version: "1.0", status: -1, running_time: 1200, test_scenario_id: b.id, device_key: "A#{i}BVDWE")
@total_report.detail_reports.create!(crash_id: crash_1.id,app_version: "1.0", status: -1, running_time: 1200, test_scenario_id: c.id, device_key: "A#{i}BVDWE")
@total_report.detail_reports.create!(crash_id: crash_2.id,app_version: "1.0", status: -1, running_time: 1200, test_scenario_id: c.id, device_key: "A#{i}BVDWE")
@total_report.detail_reports.create!(crash_id: crash_4.id,app_version: "1.0", status: -1, running_time: 1200, test_scenario_id: d.id, device_key: "A#{i}BVDWE")
@total_report.detail_reports.create!(crash_id: crash_5.id,app_version: "1.0", status: -1, running_time: 1200, test_scenario_id: d.id, device_key: "A#{i}BVDWE")
end

@total_report.detail_reports.create!(crash_id: crash_5.id,app_version: "1.0", status: -1, running_time: 1200, test_scenario_id: d.id, device_key: "A2BVDWE")

DetailReport.all.each do |d|
  d.memory_infos.create!(
          mem_total: 10,
          dalvik_heap_alloc: 10,
          native_heap_size: 10,
          mem_alloc: 10,
          dalvik_heap_size: 10,
          native_heap_alloc: 10,
          client_timestamp: 1234
      )

d.memory_infos.create!(
          mem_total: 10,
          dalvik_heap_alloc: 10,
          native_heap_size: 10,
          mem_alloc: 10,
          dalvik_heap_size: 10,
          native_heap_alloc: 10,
          client_timestamp: 1235
      )

d.cpu_infos.create!(usage: 10,client_timestamp: 1234)
d.cpu_infos.create!(usage: 20,client_timestamp: 1235)
d.cpu_infos.create!(usage: 30,client_timestamp: 1236)

d.motion_event_infos.create!(activity_class: 'asd',
          param:  '123',
          view: 'view',
          sleep: 3000,
          action_type: 'Click',client_timestamp: 1234)

d.motion_event_infos.create!(activity_class: 'asd',
          param:  '123',
          view: 'view',
          sleep: 3000,
          action_type: 'Click',client_timestamp: 1237)
end


