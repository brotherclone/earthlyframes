FactoryGirl.define do
  sequence :posttitle do |n|
    Faker::Lorem.sentence + n.to_s
  end

  factory :post do
    title {:posttitle}
    body {Faker::Lorem.paragraphs(5).to_s}
  end

end
