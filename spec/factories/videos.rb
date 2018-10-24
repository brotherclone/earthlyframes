FactoryGirl.define do
  sequence :videotitle do |n|
    Faker::Name.name + n.to_s
  end
  factory :video do
    title {:videotitle}
    description {Faker::Lorem.sentence}
    video_type {'Vimeo'}
    video_service_id {'1234'}
    song
  end
end