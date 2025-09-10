require 'rails_helper'

describe 'Mobile Navigation', :type => :feature do

  before(:each) do
    # Set viewport to mobile size to make mobile navigation visible
    page.driver.browser.manage.window.resize_to(375, 667) # iPhone size
    visit root_path
    # Wait for page to fully load and JavaScript to initialize
    expect(page).to have_content('The Earthly Frames') # Wait for page content
  end

  after(:each) do
    # Reset viewport after each test
    page.driver.browser.manage.window.resize_to(1400, 1000)
  end

  it 'opens and closes mobile navigation menu', :js => true do
    # Check that mobile navigation elements are present with more flexible selectors
    expect(page).to have_css('nav.navigation')
    expect(page).to have_css('.mobile-navigation-button')
    expect(page).to have_css('i.fa-bars')
    expect(page).not_to have_css('i.fa-solid.fa-x')
    expect(page).not_to have_css('ul.hide')

    # Click to open navigation
    find('.mobile-navigation-button').click

    # Wait for changes
    sleep(0.8)

    # Button container should have is-open class
    expect(page).to have_css('.mobile-navigation-button.is-open')

    # Click to close navigation
    find('.mobile-navigation-button').click

    # Wait for changes
    sleep(0.8)

    # Button container should not have is-open class
    expect(page).not_to have_css('.mobile-navigation-button.is-open')
  end

  it 'maintains proper state when toggling multiple times', :js => true do
    button = find('.mobile-navigation-button')

    # Test multiple open/close cycles
    2.times do |i|
      # Open navigation
      button.click
      sleep(0.5)

      expect(page).to have_css('.mobile-navigation-button.is-open')

      # Close navigation
      button.click
      sleep(0.5)

      expect(page).not_to have_css('.mobile-navigation-button.is-open')
    end
  end

  it 'is hidden on desktop screens', :js => true do
    # Reset to desktop size
    page.driver.browser.manage.window.resize_to(1400, 1000)
    visit root_path

    # Mobile navigation button should be hidden on desktop
    expect(page).not_to have_css('.mobile-navigation-button', visible: true)
    # But the navigation should still be present
    expect(page).to have_css('nav.navigation')
  end

end
