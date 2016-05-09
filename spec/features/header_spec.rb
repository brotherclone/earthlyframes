require 'rails_helper'

describe 'Navigation is available', :type => :feature do

  it 'checks for top navigation', :js => true  do
    visit root_path
    expect(page).to have_link('About', @href=about_url)
    expect(page).to have_link('Albums', @href=about_url)
    expect(page).to have_link('Shows', @href=about_url)
    expect(page).to have_link('Posts', @href=about_url)
  end

  it 'checks for footer navigation', :js => true  do
    visit root_path
    expect(page).to have_link('Privacy', @href=privacy_url)
    expect(page).to have_link('Terms and Conditions', @href=eula_url)
  end


end