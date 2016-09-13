require 'rails_helper'

RSpec.describe ShowsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(:get => '/soon').to route_to('soon#index')
    end

    it 'checks that dev routes to soon' do
      if Rails.env.development?
        expect(:get => '/').to route_to('soon#index')
      else
        expect(:get => '/').to route_to('home#index')
      end
    end

  end
end
