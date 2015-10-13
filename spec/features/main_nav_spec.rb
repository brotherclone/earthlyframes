require 'rails_helper'

RSpec.feature 'Main Nav', :type => :feature, :js=>true do
  describe 'Navigation should be there on every page' do
    it 'checks the home page for navigation' do
        visit home_path
        expect(page).to have_content 'Earthly Frames'
    end
  end
end