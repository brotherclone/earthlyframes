require 'rails_helper'

describe 'Navigation is available', :type => :feature do

  it 'checks for top navigation', :js => true  do
    visit root_path
    expect(page).to have_selector(:css, 'a[href="/about"]')
    expect(page).to have_selector(:css, 'a[href="/albums"]')
    expect(page).to have_selector(:css, 'a[href="/posts"]')
    # expect(page).to have_selector(:css, 'a[href="/videos"]')
  end

  it 'checks for footer navigation', :js => true  do
    visit root_path
    expect(page).to have_selector(:css, 'a[href="/eula"]')
  end


end