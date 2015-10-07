require 'rails_helper'

RSpec.describe ReleasesController, type: :controller do
  describe 'GET #index' do
    it 'assigns all releases as @releases' do
      release = FactoryGirl.create(:release)
      get :index
      expect(assigns(:releases)).to eq([release])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested release as @release' do
      release = FactoryGirl.create(:release)
      get :show, {:id => release.to_param}
      expect(assigns(:release)).to eq(release)
    end
  end

  describe 'GET #new' do
    it 'assigns a new release as @release' do
      get :new
      expect(assigns(:release)).to be_a_new(Release)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested release as @release' do
      release = FactoryGirl.create(:release)
      get :edit, {:id => release.to_param}
      expect(assigns(:release)).to eq(release)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Release' do
        expect {
          post :create, {:release => FactoryGirl.attributes_for(:release)}
        }.to change(Release, :count).by(1)
      end

      it 'assigns a newly created release as @release' do
        post :create, {:release => FactoryGirl.attributes_for(:release)}
        expect(assigns(:release)).to be_a(Release)
        expect(assigns(:release)).to be_persisted
      end

      it 'redirects to the created release' do
        post :create, {:release => FactoryGirl.attributes_for(:release)}
        expect(response).to redirect_to(Release.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved release as @release' do
        post :create, {:release => FactoryGirl.attributes_for(:release)}
        expect(assigns(:release)).to be_a_new(Release)
      end

      it 're-renders the new template' do
        post :create, {:release => FactoryGirl.attributes_for(:release)}
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do

      it 'updates the requested release' do
        release = FactoryGirl.create(:release)
        put :update, {:id => release.to_param, :release => FactoryGirl.attributes_for(:release)}
        release.reload
      end

      it 'assigns the requested release as @release' do
        release = FactoryGirl.create(:release)
        put :update, {:id => release.to_param, :release => FactoryGirl.attributes_for(:release)}
        expect(assigns(:release)).to eq(release)
      end

      it 'redirects to the release' do
        release = FactoryGirl.create(:release)
        put :update, {:id => release.to_param, :release => FactoryGirl.attributes_for(:release)}
        expect(response).to redirect_to(release)
      end
    end

    context 'with invalid params' do
      it 'assigns the release as @release' do
        release = FactoryGirl.create(:release)
        put :update, {:id => release.to_param, :release => FactoryGirl.attributes_for(:release, :title => nil)}
        expect(assigns(:release)).to eq(release)
      end

      it 're-renders the edit template' do
        release = FactoryGirl.create(:release)
        put :update, {:id => release.to_param, :release => FactoryGirl.attributes_for(:release, :title => nil)}
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested release' do
      release = FactoryGirl.create(:release)
      expect {
        delete :destroy, {:id => release.to_param}
      }.to change(Release, :count).by(-1)
    end

    it 'redirects to the releases list' do
      release = FactoryGirl.create(:release)
      rid = release.to_param
      delete :destroy, {:id => rid}
      get :show, {:id => rid}
      expect(response).to redirect_to(releases_url)
    end
  end

end
