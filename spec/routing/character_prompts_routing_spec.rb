require 'rails_helper'

RSpec.describe PromptsController, type: :routing do
  describe 'routing' do

    it 'routes to #index' do
      expect(:get => '/prompts').to route_to('prompts#index')
    end

    it 'routes to #show' do
      expect(:get => '/prompts/1').to route_to('prompts#show', :id => '1')
    end

  end
end
