json.array!(@character_settings) do |setting|
  json.extract! setting, :id
  json.url character_setting_url(setting, format: :json)
end
