json.array!(@prompts) do |prompt|
  json.extract! prompt, :id
  json.url prompts_url(prompt, format: :json)
end
