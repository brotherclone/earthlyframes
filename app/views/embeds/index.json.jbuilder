json.array!(@embeds) do |embed|
  json.extract! embed, :id
  json.url album_url(embed, format: :json)
end
