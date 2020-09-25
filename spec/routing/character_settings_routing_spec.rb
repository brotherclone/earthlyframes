require 'rails_helper'

RSpec.describe CharacterSettingsController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => '/character_settings').to route_to('character_settings#index')
    end

    it 'routes to #show' do
      expect(:get => '/character_settings/1').to route_to('character_settings#show', :id => '1')
    end

  end
end
