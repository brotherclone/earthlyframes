# frozen_string_literal: true
require 'rails_helper'

RSpec.describe '/posts', type: :request do

  let(:valid_attributes) do
    FactoryBot.attributes_for(:post)
  end

  let(:invalid_attributes) do
    FactoryBot.attributes_for(:post, title: nil)
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Post.create! valid_attributes
      get posts_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      post = Post.create! valid_attributes
      get post_url(post)
      expect(response).to be_successful
    end
  end

end
