require 'rails_helper'

RSpec.describe "/album_streaming_links", type: :request do

  before(:each) do
    @streaming_service = FactoryBot.create(:streaming_service)
    @album = FactoryBot.create(:album)
  end

  let(:valid_attributes) {
    FactoryBot.attributes_for(:album_streaming_link, streaming_service_id: @streaming_service.id, album_id: @album.id)
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:album_streaming_link, link: nil)
  }

  describe "GET /index" do
    it "renders a successful response" do
      AlbumStreamingLink.create! valid_attributes
      get album_album_streaming_links_url(@album)
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      album_streaming_link = AlbumStreamingLink.create! valid_attributes
      get album_album_streaming_link_path(@album, album_streaming_link)
      expect(response).to be_successful
    end
  end

end
