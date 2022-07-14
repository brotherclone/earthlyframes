require 'rails_helper'

RSpec.describe SongsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: 'albums/1/songs').to route_to('songs#index', album_id: '1')
    end

    it 'routes to #show' do
      expect(get: 'albums/1/songs/1').to route_to('songs#show', album_id: '1', id: '1')
    end

  end
end
