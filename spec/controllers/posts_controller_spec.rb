require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  
  describe 'GET #index' do
    it 'assigns all posts as @posts' do
      post = FactoryGirl.create(:post)
      get :index
      expect(assigns(:posts)).to eq([post])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested post as @post' do
      post = FactoryGirl.create(:post)
      get :show, {:id => post.to_param}
      expect(assigns(:post)).to eq(post)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Post' do
        expect {
          post :create, {:post => FactoryGirl.attributes_for(:post)}
        }.to change(Post, :count).by(1)
      end

      it 'assigns a newly created post as @post' do
        post :create, {:post => FactoryGirl.attributes_for(:post)}
        expect(assigns(:post)).to be_a(Post)
        expect(assigns(:post)).to be_persisted
      end

      it 'redirects to the created post' do
        post :create, {:post => FactoryGirl.attributes_for(:post)}
        expect(response).to redirect_to(Post.last)
      end
    end

  end

  describe 'PUT #update' do
    context 'with valid params' do

      it 'updates the requested post' do
        post = FactoryGirl.create(:post)
        put :update, {:id => post.to_param, :post => FactoryGirl.attributes_for(:post)}
        post.reload
      end

      it 'assigns the requested post as @post' do
        post = FactoryGirl.create(:post)
        put :update, {:id => post.to_param, :post => FactoryGirl.attributes_for(:post)}
        expect(assigns(:post)).to eq(post)
      end

      it 'redirects to the post' do
        post = FactoryGirl.create(:post)
        put :update, {:id => post.to_param, :post => FactoryGirl.attributes_for(:post)}
        expect(response).to redirect_to(post)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested post' do
      post = FactoryGirl.create(:post)
      expect {
        delete :destroy, {:id => post.to_param}
      }.to change(Post, :count).by(-1)
    end

    it 'redirects to the posts list' do
      post = FactoryGirl.create(:post)
      pid =post.to_param
      delete :destroy, {:id => pid}
      expect(response).to redirect_to(posts_path)
    end
  end

  describe 'Posting sequence' do
    it 'checks a published next and prev post' do
      nposts = FactoryGirl.create_list(:post,3)
      npost = nposts[1]
      get :show, {:id => npost.to_param}
      expect(npost.next_post).to be_valid
      expect(npost.prev_post).to be_valid
    end
  end

end


