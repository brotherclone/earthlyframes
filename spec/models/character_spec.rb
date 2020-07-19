require 'rails_helper'

RSpec.describe Character, type: :model do

  it 'has a valid Factory' do
    expect(build(:character)).to be_valid
  end

  it 'should not be valid without a name' do
    expect(build(:character, name: nil)).to_not be_valid
  end

  it 'should be valid with a group of entries' do
    expect(build(:character_with_entries)).to be_valid
  end

  it 'has a valid Factory with a Dead Trait' do
    expect(build(:character, :is_dead)).to be_valid
  end

  it 'has a valid Factory with a Wounded Trait' do
    expect(build(:character, :is_wounded)).to be_valid
  end

end
