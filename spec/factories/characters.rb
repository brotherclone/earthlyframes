FactoryBot.define do
  factory :character do
    user
    name {Faker::Name.first_name}
    additional_bio {Faker::Name.first_name}
    character_background
    character_setting
    character_role
    character_descriptor
  end
end
