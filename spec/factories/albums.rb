FactoryGirl.define do
  sequence :albumtitle do |n|
    Faker::Name.name + n.to_s
  end

  factory :album do
    title {:albumtitle}
    description {Faker::Lorem.paragraph}
    price {Faker::Commerce.price}
    released {Faker::Date.backward(500)}
    buylink {Faker::Internet.url}
    format{Faker::Commerce.product_name}
    cover {'http://www.placehold.it/300x300'}
  end


end
