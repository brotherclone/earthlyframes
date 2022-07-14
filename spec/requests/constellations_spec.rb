require 'rails_helper'

RSpec.describe "/constellations", type: :request do

  let(:valid_attributes) {
    FactoryBot.attributes_for(:constellation)
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:constellation, name: nil)
  }

  describe "GET /index" do
    it "renders a successful response" do
      Constellation.create! valid_attributes
      get constellations_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      constellation = Constellation.create! valid_attributes
      get constellation_url(constellation)
      expect(response).to be_successful
    end
  end

end
