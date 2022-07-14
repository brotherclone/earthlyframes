json.array!(@song_constellation) do |song_constellation|
  json.extract! song_constellation, :id
  json.url album_url(song_constellation, format: :json)
end
