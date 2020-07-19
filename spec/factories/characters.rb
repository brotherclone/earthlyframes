FactoryBot.define do
  factory :character do
    user
    name {Faker::Name.first_name}
    additional_bio {Faker::Name.first_name}
    character_background
    character_setting
    character_role
    character_descriptor
    current_health { Faker::Number.number(digits: 1) }
    max_health { Faker::Number.number(digits: 1) }
    trait :is_dead do
      current_health {0}
      max_health {0}
    end
    trait :is_wounded do
      current_health {1}
    end
    factory :character_with_entries do
      after(:create) do |character|
        create(:entry, character:character)
      end
    end
  end
end
