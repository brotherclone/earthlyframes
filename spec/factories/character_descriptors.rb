FactoryBot.define do
  factory :character_descriptor do
    descriptor {Faker::Lorem.paragraph}
  end
end
