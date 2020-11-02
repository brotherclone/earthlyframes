require 'rails_helper'

RSpec.describe EntriesController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => '/entries').to route_to('entries#index')
    end

    it 'routes to #show' do
      expect(:get => '/entries/1').to route_to('entries#show', :id => '1')
    end

    it 'creates an entry' do
      expect(:post => '/api/entries/create').to route_to('entries#create')
    end

    it 'routes to #show for the api' do
      expect(:get => '/api/entries/1').to route_to('entries#show', :id => '1')
    end

    it 'routes to #update for the api' do
      expect(:put => '/api/entries/1').to route_to('entries#update', :id => '1')
    end

    it 'routes to #delete for the api' do
      expect(:delete => '/api/entries/1').to route_to('entries#destroy', :id => '1')
    end

    it 'routes to #delete for the api' do
      expect(:get => '/api/entries-for-character').to route_to('entries#by_character')
    end

  end
end
