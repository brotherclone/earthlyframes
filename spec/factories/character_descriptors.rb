FactoryBot.define do
  factory :character_descriptor do
    descriptor {Faker::Lorem.paragraph}
    log
  end
end
