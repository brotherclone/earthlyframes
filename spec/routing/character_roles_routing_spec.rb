require 'rails_helper'

RSpec.describe CharacterRolesController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => '/character_roles').to route_to('character_roles#index')
    end

    it 'routes to #show' do
      expect(:get => '/character_roles/1').to route_to('character_roles#show', :id => '1')
    end

  end
end
