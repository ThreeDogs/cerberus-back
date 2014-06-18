collection @motion_event_infos, object_root: false
attributes :id, :activity_class, :time_stamp, :param, :view, :sleep, :action_type, :client_timestamp
node(:src){|m| m.src}