require 'rails_helper'

RSpec.describe Song, type: :model do
  it 'has a vaild Factory' do
    expect(build(:song)).to be_valid
  end
  it 'is invalid without a title' do
    expect(build(:song, title: nil)).to_not be_valid
  end
  it 'has a vaild Factory with has many callbacks' do
    expect(build(:song_with_video)).to be_valid
  end
end
