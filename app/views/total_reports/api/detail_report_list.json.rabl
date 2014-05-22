collection @detail_reports
attributes :get_status, :test_scenario_name, :device_name, :os_version, :get_running_time
node(:link){|d| total_report_detail_report_path(@total_report, d)}