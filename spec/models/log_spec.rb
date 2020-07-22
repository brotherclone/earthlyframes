require 'rails_helper'

RSpec.describe Log, type: :model do

  it 'has a valid Factory' do
    expect(build(:log)).to be_valid
  end

  it 'should be valid with a group of entries' do
    expect(build(:log_with_entries)).to be_valid
  end


end
