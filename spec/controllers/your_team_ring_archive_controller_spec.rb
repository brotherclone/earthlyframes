require 'rails_helper'

RSpec.describe YourTeamRingArchiveController, type: :controller do

  describe 'GET #index' do
    it 'checks that ytr archive has the variables for no header' do
      get :index
      expect(assigns(:no_nav)).to eq(true)
    end
  end

end
