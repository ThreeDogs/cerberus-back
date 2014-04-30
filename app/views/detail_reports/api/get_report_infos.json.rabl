object @detail_report

child @motion_event_infos, object_root: false do
	attributes :id, :activity_class, :time_stamp, :param, :view, :sleep, :action_type, :client_timestamp
end

child @memory_infos, object_root: false do
	attributes :id, :mem_total, :dalvik_heap_alloc, :native_heap_size,:mem_alloc,	:dalvik_heap_size, :native_heap_alloc, :client_timestamp
end

child @cpu_infos, object_root: false do
	attributes :id, :usage, :client_timestamp
end
