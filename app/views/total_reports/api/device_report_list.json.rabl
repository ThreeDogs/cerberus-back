collection @devices
attributes :model, :os_version, :cpu, :country
child(:error_reports){attributes :rank, :test_scenario_name, :status, :error_name}