json.array!(@entries) do |entry|
  json.extract! entry, :id
  json.url entry_url(entry_text, format: :json)
end
