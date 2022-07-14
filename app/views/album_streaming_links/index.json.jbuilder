json.array!(@album_streaming_links) do |link|
  json.extract! link, :id
  json.url album_url(link, format: :json)
end
