require 'rails_helper'

RSpec.describe ApplicationController, type: :routing do
  describe 'custom routes' do
    it 'routes to coming soon' do
      expect(:get => '/soon').to route_to('soon#index')
    end
    it 'routes to about' do
      expect(:get => '/about').to route_to('about#index')
    end
    it 'routes to eula' do
      expect(:get => '/eula').to route_to('eula#index')
    end
    it 'routes to privacy' do
      expect(:get => '/privacy').to route_to('privacy#index')
    end
  end
end

