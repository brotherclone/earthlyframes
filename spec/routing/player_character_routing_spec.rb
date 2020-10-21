require 'rails_helper'

RSpec.describe PlayerCharactersController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => '/player-characters').to route_to('player_characters#index')
    end
  end

end
