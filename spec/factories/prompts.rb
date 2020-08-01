FactoryBot.define do
  factory :prompt do
    song
    encounter_type { 0 }
    prompt_title { Faker::Lorem.sentence }
    prompt_text { Faker::Lorem.paragraph }
    prompt_image { Faker::Internet.url }
    damage { Faker::Number.number(digits:1) }
  end
end
