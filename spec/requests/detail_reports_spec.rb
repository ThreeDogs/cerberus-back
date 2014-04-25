require 'spec_helper'

describe 'DetailReports' do
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
 	it "create @detail_report" do
 		post "/api/v1/detail_reports", detail_report: detail_report_json
 		response.status.should be(201)
 	end
 end 
end



