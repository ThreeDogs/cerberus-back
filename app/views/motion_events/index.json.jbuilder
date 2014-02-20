json.array!(@motion_events) do |motion_event|
  json.extract! motion_event, :id, :seq_id, :time_stamp, :sleep, :activity_class, :action_type, :param, :view, :report_id
  json.url motion_event_url(motion_event, format: :json)
end
