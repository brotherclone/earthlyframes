describe 'Coming Soon display correctly', :type => :feature do

  it 'checks the shows index page', :js => true  do
    visit soon_path
    expect(page).to have_css('.soon-msg')
    expect(page).to have_content('back shortly')
    expect(page).not_to have_css('navigation-centered')
    expect(page).not_to have_css('footer')
  end

end
