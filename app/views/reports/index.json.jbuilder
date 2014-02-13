json.array!(@reports) do |report|
  json.extract! report, :id, :package_name, :icon, :app_version, :os_version, :time_for_test, :project_id
  json.url report_url(report, format: :json)
end
