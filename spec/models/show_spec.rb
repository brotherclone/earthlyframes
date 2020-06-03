require 'rails_helper'

RSpec.describe Show, type: :model do
  it 'has a valid Factory' do
    expect(build(:show)).to be_valid
  end
  it 'is invalid without a title' do
    expect(build(:show, title: nil)).to_not be_valid
  end
  it 'has a valid Factory with a Work In Progress Trait' do
    expect(build(:show, :wip)).to be_valid
  end
end
