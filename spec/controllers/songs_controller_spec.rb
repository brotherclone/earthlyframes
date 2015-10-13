require 'rails_helper'

RSpec.describe SongsController, type: :controller do

  describe 'GET #index' do
    it 'populates an array of songs' do
      song = FactoryGirl.create(:song)
      get :index
      expect(assigns(:songs)).to eq([song])
    end
    it 'renders the :index view' do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it 'assigns the requested song as @song' do
      song = FactoryGirl.create(:song)
      get :show, {:id => song.to_param}
      expect(assigns(:song)).to eq(song)
    end
  end

  describe 'GET #new' do
    it 'assigns a new song as @song' do
      get :new, {}
      expect(assigns(:song)).to be_a_new(Song)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested song as @song' do
      song = FactoryGirl.create(:song)
      get :edit, {:id => song.to_param}
      expect(assigns(:song)).to eq(song)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Song' do
        expect {
          post :create, {:song => FactoryGirl.attributes_for(:song)}
        }.to change(Song, :count).by(1)
      end

      it 'assigns a newly created song as @song' do
        post :create, {:song => FactoryGirl.attributes_for(:song)}
        expect(assigns(:song)).to be_a(Song)
        expect(assigns(:song)).to be_persisted
      end

      it 'redirects to the created song' do
        post :create, {:song => FactoryGirl.attributes_for(:song)}
        expect(response).to redirect_to(Song.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved song as @song' do
        post :create, {:song => FactoryGirl.attributes_for(:song, :title => nil)}
        expect(assigns(:song)).to be_a_new(Song)
      end

      it 're-renders the new template' do
        post :create, {:song => FactoryGirl.attributes_for(:song, :title => nil)}
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested song' do
        song = FactoryGirl.create(:song)
        put :update, {:id => song.to_param, :song =>  FactoryGirl.attributes_for(:song)}
        song.reload
      end

      it 'assigns the requested song as @song' do
        song = FactoryGirl.create(:song)
        put :update, {:id => song.to_param, :song => FactoryGirl.attributes_for(:song)}
        expect(assigns(:song)).to eq(song)
      end

      it 'redirects to the song' do
        song = FactoryGirl.create(:song)
        put :update, {:id => song.to_param, :song => FactoryGirl.attributes_for(:song)}
        expect(response).to redirect_to(song)
      end
    end

    context 'with invalid params' do
      it 'assigns the song as @song' do
        song = FactoryGirl.create(:song)
        put :update, {:id => song.to_param, :song => FactoryGirl.attributes_for(:song, :title => nil)}
        expect(assigns(:song)).to eq(song)
      end

      it 're-renders the edit template' do
        song = FactoryGirl.create(:song)
        put :update, {:id => song.to_param, :song => FactoryGirl.attributes_for(:song, :title => nil)}
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested song' do
      song = FactoryGirl.create(:song)
      expect {
        delete :destroy, {:id => song.to_param}
      }.to change(Song, :count).by(-1)
    end

    it 'redirects to the songs list' do
      song = FactoryGirl.create(:song)
      did = song.to_param
      delete :destroy, {:id => did}
      expect(response).to redirect_to(songs_path)
    end
  end

end
