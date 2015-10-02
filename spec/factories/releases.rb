FactoryGirl.define do
  sequence :releasetitle do |n|
    Faker::Lorem.sentence + n.to_s
  end

  factory :release do
    title {:releasetitle}
    formatname {Faker::Lorem.word}
    price {Faker::Commerce.price}
    album {FactoryGirl.create(:album)}
  end

end
