require 'rails_helper'

RSpec.describe '/videos', type: :request do

  before(:each) do
    @album = FactoryBot.create(:album)
    @song = FactoryBot.create(:song, album_id: @album.id)
  end

  let(:valid_attributes) do
    FactoryBot.attributes_for(:video, song_id: @song.id)
  end

  let(:invalid_attributes) do
    FactoryBot.attributes_for(:video, video_service_id: nil)
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Video.create! valid_attributes
      get album_song_videos_url(@album.id, @song.id)
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      video = Video.create! valid_attributes
      get album_song_video_url(@album.id, @song.id, video)
      expect(response).to be_successful
    end
  end

end
