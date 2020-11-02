require 'rails_helper'

RSpec.describe LogsController, type: :routing do
  describe 'routing' do
    it 'routes to invitation' do
      expect(:get => '/api/logs/1/invite').to route_to('logs#invite_by_email', :id => '1')
    end

    it 'routes to show a log' do
      expect(:get => '/api/logs/1').to route_to('logs#show', :id => '1')
    end

    it 'routes to create a log' do
      expect(:post => 'api/logs/create').to route_to('logs#create')
    end

  end
end
