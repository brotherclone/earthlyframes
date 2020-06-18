require 'rails_helper'

describe 'Videos display correctly', :type => :feature do

  it 'checks the videos index page', :js => true  do
    visit videos_path
    expect(page).to have_content('Videos')
    expect(page).to have_css('div.videos')
  end

end
