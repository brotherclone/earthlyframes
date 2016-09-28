FactoryGirl.define do
  sequence :albumtitle do |n|
    Faker::Name.name + n.to_s
  end
  factory :album do
    title {:albumtitle}
    brief_description {Faker::Lorem.sentence}
    description {Faker::Lorem.paragraph}
    price {Faker::Commerce.price}
    released {Faker::Date.backward(500)}
    buylink {Faker::Internet.url}
    format{Faker::Commerce.product_name}
    cover {'http://www.placehold.it/300x300'}
    is_live {true}
    trait :wip do
      is_live {false}
    end
    factory :album_with_song do
      after(:create) do |album|
        create(:song, album: album)
      end
    end
  end
end
