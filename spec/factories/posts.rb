FactoryGirl.define do
  sequence :posttitle do |n|
    Faker::Lorem.sentence + n.to_s
  end
  factory :post do
    title {:posttitle}
    body { Faker::Lorem.paragraph}
    description {Faker::Lorem.sentence}
    main_image {'http://www.placehold.it/1250x500'}
    inline_image {'http://www.placehold.it/250x250'}
    overlay_bright {false}
    post_date{Faker::Date.between(5.years.ago, Date.today)}
    is_live {true}
    trait :wip do
      is_live {false}
    end
    trait :dark_bg do
      overlay_bright {true}
    end
  end
end
