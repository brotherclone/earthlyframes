# frozen_string_literal: true
require 'rails_helper'

RSpec.describe '/streaming_services', type: :request do

  let(:valid_attributes) do
    FactoryBot.attributes_for(:streaming_service)
  end

  let(:invalid_attributes) do
    FactoryBot.attributes_for(:streaming_service, name: nil)
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      StreamingService.create! valid_attributes
      get streaming_services_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      streaming_service = StreamingService.create! valid_attributes
      get streaming_service_url(streaming_service)
      expect(response).to be_successful
    end
  end

end
