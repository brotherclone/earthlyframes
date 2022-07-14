require 'rails_helper'

RSpec.describe Constellation, type: :model do
  it 'has a valid Factory' do
    expect(build(:constellation)).to be_valid
  end
  it 'is invalid without a title' do
    expect(build(:constellation, name: nil)).to_not be_valid
  end
  it 'should have many songs through song constellations' do
    should have_many(:song_constellations)
    should have_many(:songs).through(:song_constellations)
  end
end
