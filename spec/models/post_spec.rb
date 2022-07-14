require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'has a valid Factory' do
    expect(build(:post)).to be_valid
  end
  it 'is invalid without a title' do
    expect(build(:post, title: nil)).to_not be_valid
  end
end
