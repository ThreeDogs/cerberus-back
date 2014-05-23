collection @test_scenarios
attributes :get_rank, :name, :status
node(:device_count){|t| t.devices_number}
child(:errors){|e| attributes :error_name}
child(:devices){|d| attributes :model, :os_version }
