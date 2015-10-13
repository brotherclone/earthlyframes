require 'rails_helper'

RSpec.describe 'Coming Soon', type: :request do
  describe 'GET /soon' do
    it 'gets the index' do
      expect(get: '/soon').to route_to('soon#index')
    end
  end
end
