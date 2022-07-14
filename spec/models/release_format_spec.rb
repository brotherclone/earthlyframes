require 'rails_helper'

RSpec.describe ReleaseFormat, type: :model do
  it 'has a valid Factory' do
    expect(build(:music_format)).to be_valid
  end
  it 'belongs to an album' do
    should belong_to(:album)
  end
  it 'belongs to a music format' do
    should belong_to(:music_format)
  end
end