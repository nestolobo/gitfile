json.array!(@locations) do |location|
  json.extract! location, :id, :name, :deck, :x, :y, :width, :height
  json.url location_url(location, format: :json)
end
