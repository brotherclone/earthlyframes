require 'rails_helper'

RSpec.describe VideosController, type: :controller do
  describe 'GET #index' do
    it 'assigns all videos as @videos' do
      video = FactoryGirl.create(:video)
      get :index
      expect(assigns(:videos)).to eq([video])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested video as @video' do
      video = FactoryGirl.create(:video)
      get :show, {:id => video.to_param}
      expect(assigns(:video)).to eq(video)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Video' do
        expect {
          post :create, {:video => FactoryGirl.attributes_for(:video)}
        }.to change(Video, :count).by(1)
      end

      it 'assigns a newly created video as @video' do
        post :create, {:video => FactoryGirl.attributes_for(:video)}
        expect(assigns(:video)).to be_a(Video)
        expect(assigns(:video)).to be_persisted
      end

      it 'redirects to the created video' do
        post :create, {:video => FactoryGirl.attributes_for(:video)}
        expect(response).to redirect_to(Video.last)
      end
    end

  end

  describe 'PUT #update' do
    context 'with valid params' do
      it 'updates the requested video' do
        video = FactoryGirl.create(:video)
        put :update, {:id => video.to_param, :video => FactoryGirl.attributes_for(:video)}
        video.reload
      end

      it 'assigns the requested video as @video' do
        video = FactoryGirl.create(:video)
        put :update, {:id => video.to_param, :video => FactoryGirl.attributes_for(:video)}
        expect(assigns(:video)).to eq(video)
      end

      it 'redirects to the video' do
        video = FactoryGirl.create(:video)
        put :update, {:id => video.to_param, :video => FactoryGirl.attributes_for(:video)}
        expect(response).to redirect_to(video)
      end
    end

  end

  describe 'DELETE #destroy' do
    it 'destroys the requested video' do
      video = FactoryGirl.create(:video)
      expect {
        delete :destroy, {:id => video.to_param}
      }.to change(Video, :count).by(-1)
    end

    it 'redirects to the videos list' do
      video = FactoryGirl.create(:video)
      aid = video.to_param
      delete :destroy, {:id => aid}
      expect(response).to redirect_to(videos_path)
    end
  end

end
