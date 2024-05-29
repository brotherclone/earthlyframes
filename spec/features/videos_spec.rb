require 'rails_helper'

describe 'Video Listing displays correctly', :type => :feature do

  before(:each) do
    visit music_videos_path
  end

  it 'checks for breadcrumbs', :js => true do
    expect(page).to have_css('ul.breadcrumbs')
  end

  it 'checks for page heading', :js => true do
    expect(page).to have_css('div.page-heading')
  end

  it 'ensures your team ring is the main content', :js=> true do
    expect(page).to have_text('Music Videos')
  end

  it 'ensures navigation to videos', :js=> true do
    expect(page).to have_text('videos')
  end

end