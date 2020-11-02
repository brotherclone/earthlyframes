require 'rails_helper'

RSpec.describe ConsequencesController, type: :routing do
  describe 'routing' do

    it 'routes to #reveal' do
      expect(:post => 'api/consequences').to route_to('consequences#reveal')
    end

  end
end
