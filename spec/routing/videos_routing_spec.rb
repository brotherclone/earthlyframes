require "rails_helper"

RSpec.describe VideosController, type: :routing do
  describe "routing" do
    it 'routes to #index' do
      expect(get: 'albums/1/songs/1/videos').to route_to('videos#index', album_id:'1', song_id:'1')
    end

    it 'routes to #show' do
      expect(get: 'albums/1/songs/1/videos/1').to route_to('videos#show', album_id:'1', song_id:'1',  id: '1')
    end

  end
end
