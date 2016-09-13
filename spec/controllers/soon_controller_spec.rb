require 'rails_helper'

RSpec.describe SoonController, type: :controller do

  describe 'GET #index' do
    it 'checks that soon has the variables for no header' do
      get :index
      expect(assigns(:no_nav)).to eq(true)
      expect(assigns(:no_footer)).to eq(true)
    end
  end

end
