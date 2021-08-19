require 'rails_helper'

describe 'Header and Footer Includes appear correctly', :type => :feature do

  it 'checks for a header and footers to display', :js => true do
    visit about_path
    expect(page).to have_css('header.ef-nav')
    expect(page).to have_css('footer.ef-footer')
  end

end
