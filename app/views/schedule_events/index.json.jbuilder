json.array!(@schedule_events) do |schedule_event|
  json.extract! schedule_event, :id, :teacher_id, :course_id, :start_time, :end_rime
  json.url schedule_event_url(schedule_event, format: :json)
end
