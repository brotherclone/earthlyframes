FactoryBot.define do
  factory :constellation do
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
  end
end
