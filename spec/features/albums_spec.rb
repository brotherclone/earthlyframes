require 'rails_helper'

describe 'Albums display correctly', :type => :feature do

  it 'checks the albums index page', :js => true  do
    visit albums_path
    expect(page).to have_css('h1.page-header')
    expect(page).to have_content('Albums')
    expect(page).to have_css('div.albums')
  end

  it 'checks that songs expand', :js => true do
    album = FactoryGirl.create(:album_with_song)
    visit album_path(album.id.to_s)
    click_link('songid_'+album.id.to_s)
    expect(page).to have_content('LYRICS')
  end

end
