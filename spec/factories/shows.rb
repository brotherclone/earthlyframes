FactoryGirl.define do

  sequence :showtitle do |n|
    Faker::Lorem.sentence + n.to_s
  end

  addy = Faker::Address.street_address+' '+Faker::Address.city+', '+Faker::Address.state_abbr

  factory :show do
    title {:showtitle}
    showdate {Faker::Date.between(2.years.ago, Date.today)}
    description {Faker::Lorem.paragraph}
    location {addy}
    link {Faker::Internet.url}
    flyer {'http://www.placehold.it/300x300'}
  end

end
