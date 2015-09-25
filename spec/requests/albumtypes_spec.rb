require 'rails_helper'

RSpec.describe "Albumtypes", type: :request do
  describe "GET /albumtypes" do
    it "works! (now write some real specs)" do
      get albumtypes_path
      expect(response).to have_http_status(200)
    end
  end
end
