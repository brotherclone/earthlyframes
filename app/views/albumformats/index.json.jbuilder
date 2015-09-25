json.array!(@albumformats) do |albumformat|
  json.extract! albumformat, :id
  json.url albumformat_url(albumformat, format: :json)
end
