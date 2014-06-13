object false

child @cpu_infos do
	collection @cpu_infos, object_root: false
	attributes :id, :usage, :client_timestamp
end

child @cpu_methods do
	collection @cpu_methods, object_root: false
	attributes :id, :tree_key, :parent_key, :class_name, :method_name, :start_timestamp, :end_timestamp
end