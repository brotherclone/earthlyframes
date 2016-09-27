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
    trait :dark_bg do
      overlay_bright {true}
    end
  end

end
