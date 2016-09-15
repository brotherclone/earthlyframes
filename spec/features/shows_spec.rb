describe 'Shows display correctly', :type => :feature do

  it 'checks the shows index page', :js => true  do
    visit about_path
    expect(page).to have_css('h1.page-header')
    expect(page).to have_content('Shows')
  end

end
