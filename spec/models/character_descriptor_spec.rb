require 'rails_helper'

RSpec.describe CharacterDescriptor, type: :model do

  it 'has a valid Factory' do
    expect(build(:character_descriptor)).to be_valid
  end

end
