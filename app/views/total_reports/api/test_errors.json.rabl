collection @crashes
attributes :error_rank, :error_count
node(:error_name){|crash| "#{crash.error_name}\n#{crash.error_line}"}
node(:os_versions){|crash| crash.os_version_rate.keys}