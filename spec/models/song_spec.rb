require 'rails_helper'

RSpec.describe Song, type: :model do
  it 'has a vaild Factory' do
    expect(build(:song)).to be_valid
  end
  it 'is invalid without a title' do
    expect(build(:song, title: nil)).to_not be_valid
  end
  it 'is invalid without an album' do
    expect(build(:song, albums_id: nil)).to_not be_valid
  end
end
