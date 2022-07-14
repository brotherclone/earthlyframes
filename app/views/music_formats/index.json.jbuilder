json.array!(@music_formats) do |music_format|
  json.extract! music_format, :id
  json.url album_url(music_format, format: :json)
end
