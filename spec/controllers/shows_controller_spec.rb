require 'rails_helper'

RSpec.describe ShowsController, type: :controller do

  describe 'GET #index' do
    it 'assigns all shows as @shows' do
      show = FactoryBot.create(:show)
      get :index
      expect(assigns(:shows)).to eq([show])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested show as @show' do
      show = FactoryBot.create(:show)
      get :show, {:id => show.to_param}
      expect(assigns(:show)).to eq(show)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Show' do
        expect {
          post :create, {:show => FactoryBot.attributes_for(:show)}
        }.to change(Show, :count).by(1)
      end

      it 'assigns a newly created show as @show' do
        post :create, {:show => FactoryBot.attributes_for(:show)}
        expect(assigns(:show)).to be_a(Show)
        expect(assigns(:show)).to be_persisted
      end

      it 'redirects to the created show' do
        post :create, {:show => FactoryBot.attributes_for(:show)}
        expect(response).to redirect_to(Show.last)
      end
    end

  end

  describe 'PUT #update' do
    context 'with valid params' do

      it 'updates the requested show' do
        show = FactoryBot.create(:show)
        put :update, {:id => show.to_param, :show => FactoryBot.attributes_for(:show)}
        show.reload
      end

      it 'assigns the requested show as @show' do
        show = FactoryBot.create(:show)
        put :update, {:id => show.to_param, :show => FactoryBot.attributes_for(:show)}
        expect(assigns(:show)).to eq(show)
      end

      it 'redirects to the show' do
        show = FactoryBot.create(:show)
        put :update, {:id => show.to_param, :show => FactoryBot.attributes_for(:show)}
        expect(response).to redirect_to(show)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested show' do
      show = FactoryBot.create(:show)
      expect {
        delete :destroy, {:id => show.to_param}
      }.to change(Show, :count).by(-1)
    end

    it 'redirects to the shows list' do
      show = FactoryBot.create(:show)
      sid = show.to_param
      delete :destroy, {:id => sid}
      expect(response).to redirect_to(shows_path)
    end
  end

end
