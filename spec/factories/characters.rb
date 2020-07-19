FactoryBot.define do
  factory :character do
    user
    name {FactoryBot::Name.first_name}
    additional_bio {FactoryBot::Name.first_name}
    character_background
    character_setting
    character_role
    character_descriptor
  end
end
