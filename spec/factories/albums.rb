FactoryGirl.define do
  sequence :albumtitle do |n|
    Faker::Name.name + n.to_s
  end

  factory :album do
    title {:albumtitle}
    description {Faker::Lorem.sentence(10)}
    releasedate {Faker::Date.between(600.days.ago, Date.today) }
  end


end
