FactoryBot.define do
  factory :consequence do
    prompt
    condition {0}
    image_url {'http://www.placehold.it/250x250'}
    description {Faker::Lorem.paragraph}
  end
end
