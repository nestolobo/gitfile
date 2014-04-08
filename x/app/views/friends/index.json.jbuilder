json.array!(@friends) do |friend|
  json.extract! friend, :id, :user_id, :user_id, :seq
  json.url friend_url(friend, format: :json)
end
