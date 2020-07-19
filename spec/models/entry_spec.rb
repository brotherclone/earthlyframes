require 'rails_helper'

RSpec.describe Entry, type: :model do

  it 'has a valid Factory' do
    expect(build(:entry)).to be_valid
  end

end
