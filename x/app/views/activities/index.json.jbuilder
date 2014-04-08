json.array!(@activities) do |activity|
  json.extract! activity, :id, :name, :day, :start_time, :end_time, :location_id
  json.url activity_url(activity, format: :json)
end
