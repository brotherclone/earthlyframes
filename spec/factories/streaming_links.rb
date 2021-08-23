FactoryBot.define do

  factory :streaming_link do
    song
    album
    streaming_service
    link {Faker::Internet.url}
  end

end
