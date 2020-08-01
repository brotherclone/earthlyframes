json.array!(@character_descriptors) do |descriptor|
  json.extract! descriptor, :id
  json.url character_descriptor_url(descriptor, format: :json)
end
