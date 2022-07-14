json.array!(@posts) do |post|
  json.extract! post, :id
  json.url album_url(post, format: :json)
end
