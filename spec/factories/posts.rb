FactoryGirl.define do
  sequence :posttitle do |n|
    Faker::Lorem.sentence + n.to_s
  end

  factory :post do
    title {:posttitle}
    body do
      Faker::Lorem.paragraph(5)
    end
  end

end
