require 'rails_helper'

RSpec.describe CharacterSetting, type: :model do

  it 'has a valid Factory' do
    expect(build(:character_setting)).to be_valid
  end

end
