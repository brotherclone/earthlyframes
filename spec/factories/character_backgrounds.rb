FactoryBot.define do
  factory :character_background do
    background {Faker::Lorem.paragraph}
    log
  end
end
