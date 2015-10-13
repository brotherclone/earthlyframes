require 'rails_helper'

RSpec.describe ShowsController, type: :controller do

  describe 'GET #index' do
    it 'assigns all shows as @shows' do
      show = FactoryGirl.create(:show)
      get :index
      expect(assigns(:shows)).to eq([show])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested show as @show' do
      show = FactoryGirl.create(:show)
      get :show, {:id => show.to_param}
      expect(assigns(:show)).to eq(show)
    end
  end

  describe 'GET #new' do
    it 'assigns a new show as @show' do
      get :new
      expect(assigns(:show)).to be_a_new(Show)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested show as @show' do
      show = FactoryGirl.create(:show)
      get :edit, {:id => show.to_param}
      expect(assigns(:show)).to eq(show)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Show' do
        expect {
          post :create, {:show => FactoryGirl.attributes_for(:show)}
        }.to change(Show, :count).by(1)
      end

      it 'assigns a newly created show as @show' do
        post :create, {:show => FactoryGirl.attributes_for(:show)}
        expect(assigns(:show)).to be_a(Show)
        expect(assigns(:show)).to be_persisted
      end

      it 'redirects to the created show' do
        post :create, {:show => FactoryGirl.attributes_for(:show)}
        expect(response).to redirect_to(Show.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved show as @show' do
        post :create, {:show => FactoryGirl.attributes_for(:show, :title => nil)}
        expect(assigns(:show)).to be_a_new(Show)
      end

      it 're-renders the new template' do
        post :create, {:show => FactoryGirl.attributes_for(:show, :title => nil)}
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do

      it 'updates the requested show' do
        show = FactoryGirl.create(:show)
        put :update, {:id => show.to_param, :show => FactoryGirl.attributes_for(:show)}
        show.reload
      end

      it 'assigns the requested show as @show' do
        show = FactoryGirl.create(:show)
        put :update, {:id => show.to_param, :show => FactoryGirl.attributes_for(:show)}
        expect(assigns(:show)).to eq(show)
      end

      it 'redirects to the show' do
        show = FactoryGirl.create(:show)
        put :update, {:id => show.to_param, :show => FactoryGirl.attributes_for(:show)}
        expect(response).to redirect_to(show)
      end
    end

    context 'with invalid params' do
      it 'assigns the show as @show' do
        show = FactoryGirl.create(:show)
        put :update, {:id => show.to_param, :show => FactoryGirl.attributes_for(:show, :title => nil)}
        expect(assigns(:show)).to eq(show)
      end

      it 're-renders the edit template' do
        show = FactoryGirl.create(:show)
        put :update, {:id => show.to_param, :show => FactoryGirl.attributes_for(:show, :title => nil)}
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested show' do
      show = FactoryGirl.create(:show)
      expect {
        delete :destroy, {:id => show.to_param}
      }.to change(Show, :count).by(-1)
    end

    it 'redirects to the shows list' do
      show = FactoryGirl.create(:show)
      sid = show.to_param
      delete :destroy, {:id => sid}
      expect(response).to redirect_to(shows_path)
    end
  end

end
