require 'rails_helper'

RSpec.describe Album, type: :model do

  it 'has a vaild Factory' do
    expect(build(:album)).to be_valid
  end
  it 'has a vaild Factory with has many callbacks' do
    expect(build(:album_with_song)).to be_valid
  end
  it 'has a valid Factory with a Work In Progress Trait' do
    expect(build(:album, :wip)).to be_valid
  end
  it 'is invalid without a title' do
    expect(build(:album, title: nil)).to_not be_valid
  end
end
