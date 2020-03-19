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
    # it "returns a success response" do
    #   album = Album.create! valid_attributes
    #   get :show, params: {id: album.to_param}, session: valid_session
    #   expect(response).to be_successful
    # end
  end

  describe "GET #new" do
    # it "returns a success response" do
    #   get :new, params: {}, session: valid_session
    #   expect(response).to be_successful
    # end
  end

  describe "GET #edit" do
    # it "returns a success response" do
    #   album = Album.create! valid_attributes
    #   get :edit, params: {id: album.to_param}, session: valid_session
    #   expect(response).to be_successful
    # end
  end

  describe "POST #create" do
    context "with valid params" do
      # it "creates a new Album" do
      #   expect {
      #     post :create, params: {album: valid_attributes}, session: valid_session
      #   }.to change(Album, :count).by(1)
      # end

      # it "redirects to the created album" do
      #   post :create, params: {album: valid_attributes}, session: valid_session
      #   expect(response).to redirect_to(Album.last)
      # end
    end

    context "with invalid params" do
      # it "returns a success response (i.e. to display the 'new' albumlate)" do
      #   post :create, params: {album: invalid_attributes}, session: valid_session
      #   expect(response).to be_successful
      # end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      # it "updates the requested album" do
      #   album = Album.create! valid_attributes
      #   put :update, params: {id: album.to_param, album: new_attributes}, session: valid_session
      #   album.reload
      #   skip("Add assertions for updated state")
      # end

      # it "redirects to the album" do
      #   album = Album.create! valid_attributes
      #   put :update, params: {id: album.to_param, album: valid_attributes}, session: valid_session
      #   expect(response).to redirect_to(album)
      # end
    end

    context "with invalid params" do
      # it "returns a success response (i.e. to display the 'edit' albumlate)" do
      #   album = Album.create! valid_attributes
      #   put :update, params: {id: album.to_param, album: invalid_attributes}, session: valid_session
      #   expect(response).to be_successful
      # end
    end
  end

  describe "DELETE #destroy" do
    # it "destroys the requested album" do
    #   album = Album.create! valid_attributes
    #   expect {
    #     delete :destroy, params: {id: album.to_param}, session: valid_session
    #   }.to change(Album, :count).by(-1)
    # end

    # it "redirects to the albums list" do
    #   album = Album.create! valid_attributes
    #   delete :destroy, params: {id: album.to_param}, session: valid_session
    #   expect(response).to redirect_to(albums_url)
    # end
  end
end
