FactoryBot.define do
  factory :log do
    title { Faker::Lorem.sentence }
    factory :log_with_characters do
      after(:log) do |log|
        create(:character, log:log)
      end
    end
  end
end
