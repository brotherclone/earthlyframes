require 'rails_helper'

RSpec.describe 'Coming Soon', type: :request do
  describe 'GET /soon' do
    it 'gets the index' do
      get soon_path
      expect(response).to have_http_status(200)
    end
  end
end
