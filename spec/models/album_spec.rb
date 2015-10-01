require 'rails_helper'

RSpec.describe Album, type: :model do
  it 'has a vaild Factory' do
    expect(FactoryGirl.create(:album)).to be_valid
  end
  it 'is invalid without a title' do
    expect(FactoryGirl.create(:album, title: nil)).to_not be_valid
  end
  it 'is invalid without a release date' do
    expect(FactoryGirl.create(:album, releasedate: nil)).to_not be_valid
  end
end
