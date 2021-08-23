require 'rails_helper'

RSpec.describe Album, type: :model do

  it 'has a valid Factory' do
    expect(build(:album)).to be_valid
  end
  it 'has a valid Factory with songs' do
    expect(build(:album_with_song)).to be_valid
  end
  it 'has a valid Factory with streaming link' do
    expect(build(:album_with_streaming_links)).to be_valid
  end
  it 'has a valid Factory with a Work In Progress Trait' do
    expect(build(:album, :wip)).to be_valid
  end
  it 'is invalid without a title' do
    expect(build(:album, title: nil)).to_not be_valid
  end
  it 'is valid if not part of the Rainbow Table' do
    expect(build(:album, rainbow_table: 0)).to be_valid
  end
  it 'is valid if part of the Rainbow Table' do
    expect(build(:album, rainbow_table: 1)).to be_valid
  end
end
