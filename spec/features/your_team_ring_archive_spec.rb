describe 'Coming Soon display correctly', :type => :feature do

  it 'checks the shows index page', :js => true  do
    visit yourteamring_path
    expect(page).to have_css('.your-team-ring')
    expect(page).to have_content('Your Team Ring')
  end

end
