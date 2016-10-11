require 'rails_helper'

RSpec.describe SoonController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/soon').to route_to('soon#index')
    end

    it 'checks that coming soon is no longer live.' do
      if Rails.env.production?
        expect(:get => '/').not_to route_to('soon#index')
     end
  end
end
