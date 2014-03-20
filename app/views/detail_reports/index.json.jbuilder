json.array!(@detail_reports) do |detail_report|
  json.extract! detail_report, :id, :app_version, :test_datetime, :status, :running_time, :test_scenario_id, :device_id, :total_report_id
  json.url detail_report_url(detail_report, format: :json)
end
