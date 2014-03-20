json.array!(@total_reports) do |total_report|
  json.extract! total_report, :id, :apk, :test_datetime, :project_id, :deviceship_id
  json.url total_report_url(total_report, format: :json)
end
