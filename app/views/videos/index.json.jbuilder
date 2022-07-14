json.array!(@videos) do |videos|
  json.extract! videos, :id
  json.url album_url(videos, format: :json)
end

