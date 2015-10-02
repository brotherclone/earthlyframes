FactoryGirl.define do

  sequence :showtitle do |n|
    Faker::Lorem.sentence + n.to_s
  end

  factory :show do
    title {:showtitle}
    showdate {Faker::Date.between(2.years.ago, Date.today)}
    description {Faker::Lorem.sentence(3)}
    location {Faker::Address.street_address}
    link {Faker::Internet.url}
  end

end
