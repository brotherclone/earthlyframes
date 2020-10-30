require 'rails_helper'

RSpec.describe RainbowTableController, type: :routing do
  describe 'routing' do
    it 'routes to #index s' do
      expect(:get => '/rainbow').to route_to('rainbow_table#index')
    end
  end
end
