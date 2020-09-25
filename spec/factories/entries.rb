FactoryBot.define do
  factory :entry do
    entry_text {Faker::Lorem.paragraph}
    prompt
    character
  end
end
