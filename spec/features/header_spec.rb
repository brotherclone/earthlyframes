require 'rails_helper'

RSpec.feature 'Navigation', :type => :feature, :js=>true do

  describe 'It checks the main navigation links' do

    scenario 'click the about nav item' do
      navigation_check('about', about_path)
    end

    scenario 'click the albums nav item' do
      navigation_check('albums', albums_path)
    end

    scenario 'click the posts nav item' do
      navigation_check('posts', posts_path)
    end

    scenario 'click the shows nav item' do
      navigation_check('shows', shows_path)
    end

    def navigation_check(link,path)
      visit home_path
      click_link(link)
      expect(current_path).to eq(path)
    end

  end
end