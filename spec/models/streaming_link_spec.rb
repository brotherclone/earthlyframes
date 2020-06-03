require 'rails_helper'

RSpec.describe StreamingLink, type: :model do
  it 'has a valid Factory' do
    expect(build(:streaming_link)).to be_valid
  end
end
