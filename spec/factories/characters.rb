FactoryBot.define do
  factory :character do
    user
    name {Faker::Name.first_name}
    additional_bio {Faker::Name.first_name}
    character_background
    character_setting
    character_role
    character_descriptor
    factory :character_with_entries do
      after(:create) do |character|
        create(:entry, character:character)
      end
    end
  end
end
