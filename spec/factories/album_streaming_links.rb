FactoryBot.define do

  factory :album_streaming_link do
    album
    streaming_service
    link {Faker::Internet.url}
  end

end
