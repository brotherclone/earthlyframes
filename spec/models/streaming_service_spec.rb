require 'rails_helper'

RSpec.describe StreamingService, type: :model do
  it 'has a valid Factory' do
    expect(build(:streaming_service)).to be_valid
  end
  it 'has a valid Factory with links' do
    expect(build(:streaming_service_with_links)).to be_valid
  end
end
