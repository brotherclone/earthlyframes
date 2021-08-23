require 'rails_helper'

describe 'Header and Footer Includes appear correctly', :type => :feature do

  it 'checks for a header and footers to display', :js => true do
    visit about_path
    expect(page).to have_css('header.ef-nav')
    expect(page).to have_css('footer.ef-footer')
  end

  it 'checks for a header and footers to not display', :js => true do
    visit pulsar_path
    expect(page).not_to have_css('header.ef-nav')
    expect(page).not_to have_css('footer.ef-footer')
  end

end
