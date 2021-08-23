require 'rails_helper'

RSpec.describe CharacterBackground, type: :model do

  it 'has a valid Factory' do
    expect(build(:character_background)).to be_valid
  end

end
