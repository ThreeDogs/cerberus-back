object @detail_report

child @motion_event_infos, object_root: false do
	attributes :id, :activity_class, :time_stamp, :param, :view, :sleep, :action_type, :client_timestamp
	node(:src){|m| m.src}
end

child @memory_infos, object_root: false do
	attributes :id, :mem_total, :dalvik_heap_alloc, :native_heap_size,:mem_alloc,	:dalvik_heap_size, :native_heap_alloc, :client_timestamp
end

child @cpu_infos, object_root: false do
	attributes :id, :usage, :client_timestamp
end

child @network_infos, object_root: false do
	attributes :id, :response_size, :request_size, :client_timestamp
end

child @battery_infos, object_root: false do
	attributes :id, :wifi, :threeg, :lcd, :gps, :sound, :cpu, :client_timestamp
end

child @frame_draw_times, object_root: false do
	attributes :id, :view_type, :load_start_timestamp, :load_finish_timestamp, :view_id
end