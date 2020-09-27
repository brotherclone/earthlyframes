require 'rails_helper'

RSpec.describe PlayerCharactersController, type: :routing do
  describe 'routing' do
    it 'routes to player character data' do
      expect(:get => '/api/player-character-info').to route_to('player_characters#index')
    end
  end
end

