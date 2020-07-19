FactoryBot.define do
  factory :character_role do
    character_role {Faker::Lorem.paragraph}
    log
  end
end
