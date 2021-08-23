require 'rails_helper'

RSpec.describe YourTeamRingArchiveController, type: :routing do
  describe 'routing' do
    it 'routes to #index with multiple aliases' do
      expect(:get => '/ytr').to route_to('your_team_ring_archive#index')
      expect(:get => '/yourteamring').to route_to('your_team_ring_archive#index')
      expect(:get => '/your-team-ring').to route_to('your_team_ring_archive#index')
    end
  end
end
