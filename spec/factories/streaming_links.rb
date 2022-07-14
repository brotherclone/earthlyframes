FactoryBot.define do

  factory :streaming_link do
    song
    streaming_service
    link {Faker::Internet.url}
  end

end
