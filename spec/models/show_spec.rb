require 'rails_helper'

RSpec.describe Show, type: :model do
  it 'has a vaild Factory' do
    expect(build(:show)).to be_valid
  end
  it 'is invalid without a title' do
    expect(build(:song, title: nil)).to_not be_valid
  end
end
