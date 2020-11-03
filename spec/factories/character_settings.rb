FactoryBot.define do
  factory :character_setting do
    place {Faker::Lorem.paragraph}
    time {Faker::Lorem.paragraph}
    image_url { 'http://www.placehold.it/1250x500' }
  end
end
