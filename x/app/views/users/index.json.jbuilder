json.array!(@users) do |user|
  json.extract! user, :id, :name, :num, :interest_level, :room_type_id, :room_id
  json.url user_url(user, format: :json)
end
