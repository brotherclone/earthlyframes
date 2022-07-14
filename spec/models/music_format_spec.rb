require 'rails_helper'

RSpec.describe MusicFormat, type: :model do
  it 'has a valid Factory' do
    expect(build(:music_format)).to be_valid
  end
  it 'should have albums through release formats' do
    should have_many(:release_formats)
    should have_many(:albums).through(:release_formats)
  end
  it 'is invalid without a name' do
    expect(build(:music_format, name: nil)).to_not be_valid
  end
end
