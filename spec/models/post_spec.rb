require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'has a vaild Factory' do
    expect(build(:post)).to be_valid
  end
end
