require 'spec_helper'

describe 'DetailReports' do
 describe 'POST /api/v1/detail_reports/upload_screenshot' do
  # it "create @screen" do
    # image_path = "#{Rails.root}/app/assets/images/screenshots/ss1.png"
    # # screen_json = {image: Rack::Test::UploadedFile.new(image_path, 'image/png'), client_timestamp: 1234}
    # post '/api/v1/detail_reports/upload_screenshot', image: Rack::Test::UploadedFile.new(image_path, 'image/png'), client_timestamp: 1234
    # response.status.should be(201)
    # response.body.should include("image updated")
  # end  
 end

 describe 'POST /api/v1/detail_reports' do
 	detail_report_json = {app_version: '1.0', device_key: 'asd2asda', running_time:1200, status:1, test_scenario_id:1,total_report_id:1,
  	memory_infos_attributes:[
      {
          mem_total: 10,
          dalvik_heap_alloc: 10,
          native_heap_size: 10,
          mem_alloc: 10,
          dalvik_heap_size: 10,
          native_heap_alloc: 10,
      },
      {
          mem_total: 10,
          dalvik_heap_alloc: 10,
          native_heap_size: 10,
          mem_alloc: 10,
          dalvik_heap_size: 10,
          native_heap_alloc: 10,
      }
    ],
  	cpu_infos_attributes:[
      {
          usage: 10,
      },
      {
          usage: 20,
      }
    ],
  	motion_event_infos_attributes:[
      {
          activity_class: 'asd',
          param:  '123',
          view: 'view',
          sleep: 3000,
          action_type: 'Click',
      },
      {
          activity_class: 'asd',
          param: '123',
          view: 'view',
          sleep: 3000,
          action_type: 'Click',
      }
    ]}.to_json

  crash_json = {error_name: 'java.lang.NullPointerException',error_line: '(com.autoschedule.proto.c.a:-1)', description: 'java.lang.NullPointerException (com.autoschedule.proto.c.a:-1) Error description and so on..', total_report_id: 1}.to_json

 	it "create @detail_report" do
 		post "/api/v1/detail_reports", detail_report: detail_report_json
 		response.status.should be(201)
 	end

  it "create @detail_report with crash" do
    post "/api/v1/detail_reports", detail_report: detail_report_json, crash: crash_json
    response.status.should be(201)
    response.body.should include('java.lang.NullPointerException')
  end
 end 
end
