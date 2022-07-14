require 'rails_helper'

RSpec.describe AlbumsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/albums').to route_to('albums#index')
    end

    it 'routes to #show' do
      expect(get: '/albums/1').to route_to('albums#show', id: '1')
    end

  end
end
