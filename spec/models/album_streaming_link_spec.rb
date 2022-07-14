require 'rails_helper'

RSpec.describe AlbumStreamingLink, type: :model do
  it 'has a valid Factory' do
    expect(build(:album_streaming_link)).to be_valid
  end
  it 'belong to a streaming service' do
    should belong_to(:streaming_service)
  end

  it 'belong to an album' do
    should belong_to(:album)
  end
  it 'is invalid without a link' do
    expect(build(:streaming_link, link: nil)).to_not be_valid
  end
end
