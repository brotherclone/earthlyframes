FactoryBot.define do
  factory :log do
    factory :log_with_entries do
      after(:log) do |log|
        create(:entry, log:log)
      end
    end
  end
end
