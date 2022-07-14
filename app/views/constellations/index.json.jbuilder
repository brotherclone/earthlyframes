json.array!(@constellations) do |constellation|
  json.extract! constellation, :id
  json.url album_url(constellation, format: :json)
end
