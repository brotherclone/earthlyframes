require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
  describe 'GET #index' do
    it 'assigns all albums as @albums' do
      album = FactoryGirl.create(:album)
      get :index
      expect(assigns(:albums)).to eq([album])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested album as @album' do
      album = FactoryGirl.create(:album)
      get :show, {:id => album.to_param}
      expect(assigns(:album)).to eq(album)
    end
  end

  # describe 'GET #new' do
  #   it 'assigns a new album as @album' do
  #     get :new
  #     expect(assigns(:album)).to be_a_new(Album)
  #   end
  # end

  # describe 'GET #edit' do
  #   it 'assigns the requested album as @album' do
  #     album = FactoryGirl.create(:album)
  #     get :edit, {:id => album.to_param}
  #     expect(assigns(:album)).to eq(album)
  #   end
  # end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Album' do
        expect {
          post :create, {:album => FactoryGirl.attributes_for(:album)}
        }.to change(Album, :count).by(1)
      end

      it 'assigns a newly created album as @album' do
        post :create, {:album => FactoryGirl.attributes_for(:album)}
        expect(assigns(:album)).to be_a(Album)
        expect(assigns(:album)).to be_persisted
      end

      it 'redirects to the created album' do
        post :create, {:album => FactoryGirl.attributes_for(:album)}
        expect(response).to redirect_to(Album.last)
      end
    end

    # context 'with invalid params' do
    #   it 'assigns a newly created but unsaved album as @album' do
    #     post :create, {:album => FactoryGirl.attributes_for(:album, :title => nil)}
    #     expect(assigns(:album)).to be_a_new(Album)
    #   end
    #
    #   it 're-renders the new template' do
    #     post :create, {:album => FactoryGirl.attributes_for(:album, :title => nil)}
    #     expect(response).to render_template('new')
    #   end
    # end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested album' do
        album = FactoryGirl.create(:album)
        put :update, {:id => album.to_param, :album => FactoryGirl.attributes_for(:album)}
        album.reload
      end

      it 'assigns the requested album as @album' do
        album = FactoryGirl.create(:album)
        put :update, {:id => album.to_param, :album => FactoryGirl.attributes_for(:album)}
        expect(assigns(:album)).to eq(album)
      end

      it 'redirects to the album' do
        album = FactoryGirl.create(:album)
        put :update, {:id => album.to_param, :album => FactoryGirl.attributes_for(:album)}
        expect(response).to redirect_to(album)
      end
    end

    # context 'with invalid params' do
    #   it 'assigns the album as @album' do
    #     album = FactoryGirl.create(:album)
    #     put :update, {:id => album.to_param, :album => FactoryGirl.attributes_for(:album, :title => nil)}
    #     expect(assigns(:album)).to eq(album)
    #   end
    #
    #   it 're-renders the edit template' do
    #     album = FactoryGirl.create(:album)
    #     put :update, {:id => album.to_param, :album => FactoryGirl.attributes_for(:album, :title => nil)}
    #     expect(response).to render_template('edit')
    #   end
    # end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested album' do
      album = FactoryGirl.create(:album)
      expect {
        delete :destroy, {:id => album.to_param}
      }.to change(Album, :count).by(-1)
    end

    it 'redirects to the albums list' do
      album = FactoryGirl.create(:album)
      aid = album.to_param
      delete :destroy, {:id => aid}
      expect(response).to redirect_to(albums_path)
    end
  end

end
