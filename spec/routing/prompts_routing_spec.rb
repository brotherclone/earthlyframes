require 'rails_helper'

RSpec.describe PromptsController, type: :routing do
  describe 'routing' do
    it 'routes to api prompts' do
      expect(:get => '/api/prompts/').to route_to('prompts#get_from_last_entry')
    end
  end
end
