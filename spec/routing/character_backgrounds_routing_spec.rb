require 'rails_helper'

RSpec.describe CharacterBackgroundsController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => '/character_backgrounds').to route_to('character_backgrounds#index')
    end

    it 'routes to #show' do
      expect(:get => '/character_backgrounds/1').to route_to('character_backgrounds#show', :id => '1')
    end

  end
end
