json.array!(@songs) do |song|
  json.extract! song, :id
  json.url album_url(song, format: :json)
end

