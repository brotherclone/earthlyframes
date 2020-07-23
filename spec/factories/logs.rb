FactoryBot.define do
  factory :log do
    factory :log_with_characters do
      after(:log) do |log|
        create(:character, log:log)
      end
    end
  end
end
