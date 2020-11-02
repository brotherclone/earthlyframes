require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do

  let(:valid_attributes) {
    FactoryBot.attributes_for(:album)
  }

  let(:invalid_attributes) {
    FactoryBot.attributes_for(:album)
  }

  let(:valid_session){
    FactoryBot.attributes_for(:album)
  }

  describe "GET #index" do
    it "returns a success response" do
      Album.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      album = Album.create! valid_attributes
      get :show, params: {id: album.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

end