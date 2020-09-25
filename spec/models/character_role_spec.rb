require 'rails_helper'

RSpec.describe CharacterRole, type: :model do

  it 'has a valid Factory' do
    expect(build(:character_role)).to be_valid
  end

end
