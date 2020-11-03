FactoryBot.define do
  factory :character_role do
    character_role {Faker::Lorem.paragraph}
    image_url { 'http://www.placehold.it/1250x500' }
  end
end
