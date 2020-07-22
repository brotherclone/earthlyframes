FactoryBot.define do
  factory :entry do
    log
    entry_text {Faker::Lorem.paragraph}
    prompt
    character
  end
end
