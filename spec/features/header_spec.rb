require 'rails_helper'

RSpec.feature 'Navigation', :type => :feature, :js=>true do

  describe 'It checks the main navigation links' do

    scenario 'click the about nav item' do
      navigation_check('about')
    end

    scenario 'click the albums nav item' do
      navigation_check('albums')
    end

    scenario 'click the posts nav item' do
      navigation_check('posts')
    end

    scenario 'click the shows nav item' do
      navigation_check('shows')
    end

    def navigation_check(link)
      visit home_path
      click_link(link)
      expect(page).to have_content(link)
    end

  end
end