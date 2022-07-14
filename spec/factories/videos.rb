FactoryBot.define do
  factory :video do
    title { Faker::Lorem.word}
    description {Faker::Lorem.sentence}
    video_type { :vimeo }
    video_service_id {'1234'}
    song
  end
end