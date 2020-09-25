require 'rails_helper'

RSpec.describe EntriesController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => '/entries').to route_to('entries#index')
    end

    it 'routes to #show' do
      expect(:get => '/entries/1').to route_to('entries#show', :id => '1')
    end

  end
end
