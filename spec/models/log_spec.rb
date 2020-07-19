require 'rails_helper'

RSpec.describe Log, type: :model do

  it 'has a valid Factory' do
    expect(build(:log)).to be_valid
  end

end
