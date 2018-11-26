require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe 'GET #index' do
    it 'assigns all albums as @albums' do
      album = FactoryBot.create(:album)
      get :index
      expect(assigns(:albums)).to eq([album])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested album as @album' do
      album = FactoryBot.create(:album)
      get :show, {:id => album.to_param}
      expect(assigns(:album)).to eq(album)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Album' do
        expect {
          post :create, {:album => FactoryBot.attributes_for(:album)}
        }.to change(Album, :count).by(1)
      end

      it 'assigns a newly created album as @album' do
        post :create, {:album => FactoryBot.attributes_for(:album)}
        expect(assigns(:album)).to be_a(Album)
        expect(assigns(:album)).to be_persisted
      end

      it 'redirects to the created album' do
        post :create, {:album => FactoryBot.attributes_for(:album)}
        expect(response).to redirect_to(Album.last)
      end
    end

  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested album' do
        album = FactoryBot.create(:album)
        put :update, {:id => album.to_param, :album => FactoryBot.attributes_for(:album)}
        album.reload
      end

      it 'assigns the requested album as @album' do
        album = FactoryBot.create(:album)
        put :update, {:id => album.to_param, :album => FactoryBot.attributes_for(:album)}
        expect(assigns(:album)).to eq(album)
      end

      it 'redirects to the album' do
        album = FactoryBot.create(:album)
        put :update, {:id => album.to_param, :album => FactoryBot.attributes_for(:album)}
        expect(response).to redirect_to(album)
      end
    end

  end

  describe 'DELETE #destroy' do
    it 'destroys the requested album' do
      album = FactoryBot.create(:album)
      expect {
        delete :destroy, {:id => album.to_param}
      }.to change(Album, :count).by(-1)
    end

    it 'redirects to the albums list' do
      album = FactoryBot.create(:album)
      aid = album.to_param
      delete :destroy, {:id => aid}
      expect(response).to redirect_to(albums_path)
    end
  end

end
