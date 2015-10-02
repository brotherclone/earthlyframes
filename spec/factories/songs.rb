FactoryGirl.define do

  sequence :songtitle do |n|
    Faker::Lorem.sentence + n.to_s
  end


  factory :song do
    title {:songtitle}
    trt {Faker::Number.number(3)}
    notes {Faker::Lorem.paragraphs(3)}
    lyrics {Faker::Lorem.paragraph(4)}
    album {FactoryGirl.create(:album)}
  end

end
