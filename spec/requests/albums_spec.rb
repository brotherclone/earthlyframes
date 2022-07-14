require 'rails_helper'

RSpec.describe '/albums', type: :request do

  let(:valid_attributes) {
    FactoryBot.attributes_for(:album)
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:album, title: nil)
  }

  describe 'GET /index' do
    it 'renders a successful response' do
      Album.create! valid_attributes
      get albums_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      album = Album.create! valid_attributes
      get album_url(album)
      expect(response).to be_successful
    end
  end

end
