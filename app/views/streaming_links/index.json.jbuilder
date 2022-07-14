json.array!(@streaming_links) do |streaming_link|
  json.extract! streaming_link, :id
  json.url album_url(streaming_link, format: :json)
end

