require 'rails_helper'

RSpec.describe Embed, type: :model do
  it 'has a valid Factory' do
    expect(build(:embed)).to be_valid
  end
  it 'belong to a song' do
    should belong_to(:song)
  end
  it 'belong to a streaming service' do
    should belong_to(:streaming_service)
  end
  it 'is invalid without a link' do
    expect(build(:embed, player_identifier: nil)).to_not be_valid
  end
end
