require 'rails_helper'

RSpec.describe "/streaming_links", type: :request do

  before(:each) do
    @album = FactoryBot.create(:album)
    @streaming_service = FactoryBot.create(:streaming_service)
    @song = FactoryBot.create(:song)
  end

  let(:valid_attributes) {
    FactoryBot.attributes_for(:streaming_link, streaming_service_id: @streaming_service.id, song_id: @song.id )
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:streaming_link, link: nil)
  }

  describe "GET /index" do
    it "renders a successful response" do
      StreamingLink.create! valid_attributes
      get album_song_streaming_links_url(@album, @song)
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      streaming_link = StreamingLink.create! valid_attributes
      get album_song_streaming_link_url(@album, @song, streaming_link)
      expect(response).to be_successful
    end
  end

end
