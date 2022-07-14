# frozen_string_literal: true
require 'rails_helper'

RSpec.describe '/music_formats', type: :request do

  let(:valid_attributes) do
    FactoryBot.attributes_for(:music_format)
  end

  let(:invalid_attributes) do
    FactoryBot.attributes_for(:music_format, name: nil)
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      MusicFormat.create! valid_attributes
      get music_formats_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      music_format = MusicFormat.create! valid_attributes
      get music_format_url(music_format)
      expect(response).to be_successful
    end
  end

end
