require 'rails_helper'

RSpec.describe CharactersController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => '/characters').to route_to('characters#index')
    end

    it 'routes to #show' do
      expect(:get => '/characters/1').to route_to('characters#show', :id => '1')
    end

    it 'routes to a character' do
      expect(:get => '/api/characters/1').to route_to('characters#show', :id => '1')
    end

    it 'routes to character creation' do
      expect(:post => '/api/characters/create').to route_to('characters#create')
    end

    it 'updates a character' do
      expect(:put => '/api/characters/1').to route_to('characters#update', :id=> '1')
    end

    it 'archives a character' do
      expect(:post => '/api/characters/1/archive').to route_to('characters#archive', :id=> '1')
    end

  end
end
