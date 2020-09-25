require 'rails_helper'

RSpec.describe CharacterDescriptorsController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => '/character_descriptors').to route_to('character_descriptors#index')
    end

    it 'routes to #show' do
      expect(:get => '/character_descriptors/1').to route_to('character_descriptors#show', :id => '1')
    end

  end
end
