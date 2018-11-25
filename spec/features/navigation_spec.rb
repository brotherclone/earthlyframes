require 'rails_helper'

describe 'Navigation is available', :type => :feature do

  it 'checks for top navigation', :js => true  do
    visit root_path
    expect(page).to have_link('About', @href=about_url)
    expect(page).to have_link('Albums', @href=albums_url)
    expect(page).to have_link('Shows', @href=shows_url)
    expect(page).to have_link('Posts', @href=posts_url)
    expect(page).to have_link('Videos', @href=videos_url)
  end

  it 'checks for footer navigation', :js => true  do
    visit root_path
    expect(page).to have_link('Terms and Conditions', @href=eula_url)
  end


end