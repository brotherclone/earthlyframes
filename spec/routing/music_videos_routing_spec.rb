require "rails_helper"

RSpec.describe MusicVideosController, type: :routing do
  describe "routing" do
    it 'routes to #index' do
      expect(get: '/music-videos').to route_to('music_videos#index')
    end
  end
end
