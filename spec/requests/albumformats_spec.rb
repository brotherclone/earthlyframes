require 'rails_helper'

RSpec.describe "Albumformats", type: :request do
  describe "GET /albumformats" do
    it "works! (now write some real specs)" do
      get albumformats_path
      expect(response).to have_http_status(200)
    end
  end
end
