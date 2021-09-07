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
end
