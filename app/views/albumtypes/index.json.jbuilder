json.array!(@albumtypes) do |albumtype|
  json.extract! albumtype, :id
  json.url albumtype_url(albumtype, format: :json)
end
