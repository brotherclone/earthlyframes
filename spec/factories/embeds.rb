FactoryBot.define do
  factory :embed do
    player_identifier { Faker::IDNumber }
    artist_link { Faker::Internet.url }
    color { Faker::Color }
    text_color { Faker::Color }
    embed_code { Faker::Lorem.paragraph }
    streaming_service
    song
  end
end