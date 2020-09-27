require 'rails_helper'

RSpec.describe CharacterSettingsController, type: :routing do
  describe 'routing' do

    it 'routes to #reveal' do
      expect(:get => '/reveal').to route_to('consequences#reveal')
    end
    
  end
end
