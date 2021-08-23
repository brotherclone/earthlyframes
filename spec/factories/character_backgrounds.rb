FactoryBot.define do
  factory :character_background do
    background {Faker::Lorem.paragraph}
  end
end
