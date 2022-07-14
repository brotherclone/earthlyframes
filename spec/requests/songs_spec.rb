require 'rails_helper'

RSpec.describe '/songs', type: :request do

  before do
    @album = FactoryBot.create(:album)
  end

  let(:valid_attributes) do
    FactoryBot.attributes_for(:song, album_id: @album.id)
  end

  let(:invalid_attributes) do
    FactoryBot.attributes_for(:song, title: nil)
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Song.create! valid_attributes
      get album_songs_url(@album)
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      Song.create! valid_attributes
      get album_songs_url(@album)
      expect(response).to be_successful
    end
  end

end
