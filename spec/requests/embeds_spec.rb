require 'rails_helper'

RSpec.describe "embeds", type: :request do

  before(:each) do
    @streaming_service = FactoryBot.create(:streaming_service)
    @album = FactoryBot.create(:album)
    @song = FactoryBot.create(:song, album_id: @album.id)
  end

  let(:valid_attributes) {
    FactoryBot.attributes_for(:embed, streaming_service_id: @streaming_service.id, song_id: @song.id)
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:embed, streaming_service_id: nil)
  }

  describe "GET /index" do
    it "renders a successful response" do
      Embed.create! valid_attributes
      get album_song_embeds_path(@album, @song)
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      embed = Embed.create! valid_attributes
      get album_song_embed_path(@album, @song, embed)
      expect(response).to be_successful
    end
  end

end
