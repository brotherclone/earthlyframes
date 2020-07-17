require 'rails_helper'

RSpec.describe User, type: :model do

  it 'has a valid Factory' do
    expect(build(:user)).to be_valid
  end

end
