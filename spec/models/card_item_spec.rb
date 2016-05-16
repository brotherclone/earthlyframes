require 'rails_helper'

RSpec.describe CardItem, type: :model do

  it 'has a vaild Factory' do
    factory = build(:card_item)
    expect(factory.title.to_s).to eq('A Title')
    expect(factory.description.to_s).to eq('A description')
    expect(factory.img.to_s).to eq('http://www.placehold.it/300x300')
    expect(factory.link.to_s).to eq('/thing/1')
  end

  it 'collects instances' do
    test_one = build(:card_item)
    test_two = build(:card_item)
    expect(CardItem.all_instances.length).to be > 2
  end
end
