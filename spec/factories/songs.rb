FactoryGirl.define do

  sequence :songtitle do |n|
    Faker::Lorem.sentence + n.to_s
  end

  factory :song do
    title {:songtitle}
    trt {Faker::Number.number(3)}
    notes {Faker::Lorem.paragraph}
    lyrics {Faker::Lorem.paragraph}
    album
  end

end
