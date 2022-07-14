require 'rails_helper'

RSpec.describe SongConstellation, type: :model do
  it 'has a valid Factory' do
    expect(build(:song_constellation)).to be_valid
  end
  it 'is invalid without a sequence number' do
    expect(build(:song_constellation, sequence_number: nil)).to_not be_valid
  end
  it 'belong to a constellation' do
    should belong_to(:constellation)
  end
  it 'belong to a song' do
    should belong_to(:song)
  end
end
