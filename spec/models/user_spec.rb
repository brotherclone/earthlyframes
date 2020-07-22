require 'rails_helper'

RSpec.describe User, type: :model do

  it 'has a valid Factory' do
    expect(build(:user)).to be_valid
  end

  it 'should be valid with characters' do
    expect(build(:user_with_characters)).to be_valid
  end

  it 'should be valid with entries' do
    expect(build(:user_with_entries)).to be_valid
  end

end
