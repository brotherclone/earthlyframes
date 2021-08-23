require 'rails_helper'

RSpec.describe Video, type: :model do
  it 'has a valid Factory' do
    expect(build(:video)).to be_valid
  end
  it 'is invalid without a video_service_id' do
    expect(build(:video, video_service_id: nil)).to_not be_valid
  end
end
