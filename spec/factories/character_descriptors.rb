FactoryBot.define do
  factory :character_descriptor do
    descriptor {Faker::Lorem.paragraph}
    image_url { 'http://www.placehold.it/1250x500' }
  end
end
