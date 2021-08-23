require 'rails_helper'

RSpec.describe PulsarController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/pulsar').to route_to('pulsar#index')
    end
  end
end
