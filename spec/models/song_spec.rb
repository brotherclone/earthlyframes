require 'rails_helper'

RSpec.describe Song, type: :model do
  it 'has a valid Factory' do
    expect(build(:song)).to be_valid
  end
  it 'is invalid without a title' do
    expect(build(:song, title: nil)).to_not be_valid
  end
  it 'has a valid Factory with videos' do
    expect(build(:song_with_video)).to be_valid
  end
  it 'has a valid Factory with streaming links' do
    expect(build(:song_with_streaming_links)).to be_valid
  end
  it 'belong to an album' do
    should belong_to(:album)
  end
  it 'have videos' do
    should have_many(:videos)
  end
  it 'has many streaming links' do
    should have_many(:streaming_links)
  end
  it 'should have many constellations through song constellations' do
    should have_many(:song_constellations)
    should have_many(:constellations).through(:song_constellations)
  end
end
