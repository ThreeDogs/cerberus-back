object @report

child @motion_events, object_root: false do
	attributes :id, :activity_class, :time_stamp, :param, :view, :sleep, :action_type
end

child @memory_infos, object_root: false do
	attributes :id, :mem_total, :dalvik_heap_alloc, :native_heap_size,:mem_alloc,	:dalvik_heap_size, :native_heap_alloc
end

child @cpu_infos, object_root: false do
	attributes :id, :usage
end
