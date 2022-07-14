FactoryBot.define do
  factory :post do
    title { Faker::Lorem.word }
    body { Faker::Lorem.paragraph }
    description { Faker::Lorem.sentence }
    main_image { Faker::Internet.url }
    is_live { true }
  end
end
