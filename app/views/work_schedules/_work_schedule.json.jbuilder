json.extract! work_schedule, :id, :trainer_id, :day_of_week, :start_time, :end_time, :created_at, :updated_at
json.url work_schedule_url(work_schedule, format: :json)
