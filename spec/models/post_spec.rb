require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'has a vaild Factory' do
    expect(build(:post)).to be_valid
  end
  it 'is invalid without a title' do
    expect(build(:song, title: nil)).to_not be_valid
  end

  it 'has a valid factory with a dark image' do
    expect(build(:post, :dark_bg)).to be_valid
  end

end
