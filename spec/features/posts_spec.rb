describe 'Posts display correctly', :type => :feature do

  it 'checks the posts index page', :js => true  do
    visit about_path
    expect(page).to have_css('h1.page-header')
    expect(page).to have_content('Posts')
  end

end
