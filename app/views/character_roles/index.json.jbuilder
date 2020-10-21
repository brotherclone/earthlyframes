json.array!(@character_roles) do |role|
  json.extract! role, :id
  json.url character_role_url(role, format: :json)
end
