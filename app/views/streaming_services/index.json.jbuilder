json.array!(@streaming_services) do |streaming_service|
  json.extract! streaming_service, :id
  json.url album_url(streaming_service, format: :json)
end

