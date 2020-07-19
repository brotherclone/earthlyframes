FactoryBot.define do
  factory :prompt do
    song
    prompt_text {Faker::Lorem.paragraph}
    prompt_image {Faker::Internet.url}
  end
end
