FactoryBot.define do
  factory :album do
    title { Faker::Name.unique.name }
    brief_description { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    price { Faker::Commerce.price }
    released { Faker::Date.backward(days: 500) }
    buy_link { Faker::Internet.url }
    cover { Faker::Internet.url }
    rainbow_table { :red }
    rainbow_portrait { Faker::Internet.url }
    is_live { true }
    trait :wip do
      is_live { false }
    end
    factory :album_with_song do
      after(:create) do |album|
        create(:song, album: album)
      end
    end
    factory :album_with_streaming_links do
      after(:create) do |album|
        create(:streaming_link, album: album)
      end
    end
    factory :album_with_release_format do
      after(:create) do |album|
        create(:release_format, album: album)
      end
    end
  end
end
