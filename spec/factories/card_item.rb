FactoryGirl.define do

  factory :card_item do
    title 'A Title'
    description 'A description'
    img 'http://www.placehold.it/300x300'
    link '/thing/1'
    initialize_with { new(title, description, img, link) }
  end

end
