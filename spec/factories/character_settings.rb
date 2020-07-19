FactoryBot.define do
  factory :character_setting do
    place {Faker::Lorem.paragraph}
    time {Faker::Lorem.paragraph}
  end
end
