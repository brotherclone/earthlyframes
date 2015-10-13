require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe 'GET /home' do
    it 'gets the index' do
      expect(get: '/home').to route_to('home#index')
    end
  end
end
