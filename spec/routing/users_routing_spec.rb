require 'rails_helper'

RSpec.describe UsersController, type: :routing do
  describe 'routing' do

    it 'routes to #create' do
      expect(:post => '/api/users/create').to route_to('users#create')
    end


    it 'routes to get by email' do
      expect(:get => '/api/get-user-by-email').to route_to('users#by_email')
    end


  end
end