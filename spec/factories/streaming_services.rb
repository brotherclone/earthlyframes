FactoryBot.define do
  factory :streaming_service do
    name { Faker::Lorem.word }
    icon { 'style' }
    factory :streaming_service_with_links do
      after(:create) do |streaming_service|
        create(:streaming_link, streaming_service: streaming_service)
      end
    end
  end
end
