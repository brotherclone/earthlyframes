require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe 'GET /home' do
    it 'gets the index' do
      get home_path
      expect(response).to have_http_status(200)
    end
  end
end
