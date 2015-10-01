FactoryGirl.define do
  sequence :title do |n|
    Faker::Name.name + n.to_s
  end

  factory :album do
    title
    description {Faker::Lorem.sentence(10)}
    releasedate {Faker::Date.between(600.days.ago, Date.today) }
  end

end
