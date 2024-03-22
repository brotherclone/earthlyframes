json.array!(@mixes) do |mix|
  json.extract! mix, :id
  json.url album_url(mix, format: :json)
end

