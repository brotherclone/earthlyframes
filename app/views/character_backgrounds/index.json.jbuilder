json.array!(@character_backgrounds) do |background|
  json.extract! background, :id
  json.url character_background_url(background, format: :json)
end
