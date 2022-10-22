require 'rails_helper'

RSpec.describe 'Dashboards', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:test_user) { build(:user) }

  it 'loads the dashboard#index page with the SomnianT logo, when test_user is logged in' do
    login_as(test_user)
    visit root_path

    expect(page).to have_content('SomnianT')
    expect(page).to have_content('Discover People')
    expect(page).to have_content('Dashboard')
  end

  it 'does not load the dashboard#index page, redirects to landing page, when test_user is not logged in ' do
    visit root_path

    expect(page).to have_content('SomnianT')
    expect(page).to have_content('Create New Account')
    expect(page).to have_content('Forgotten password')
  end

  describe 'Dashboard side menu funcionality' do
    before do
      login_as(test_user)
      create_list(:user, 2)
      visit root_path
    end

    it 'Opens the discover people view' do
      click_on 'Discover People'

      expect(page).to have_content('Add Friend')
      expect(page).to have_content('Message')
    end

    it 'Redirect to dashboard#index' do
      click_on 'Discover People'
      click_on 'Dashboard'

      expect(page).to have_content('SomnianT')
      expect(page).to have_content('Discover People')
      expect(page).to have_content('Contacts')
    end

    it 'Signs test_user out' do
      click_on 'Sign out'

      expect(page).to have_content('SomnianT')
      expect(page).to have_content('Create New Account')
      expect(page).to have_content('Forgotten password')
    end
  end

  describe 'Dashboard navigation bar functionality' do
    before do
      login_as(test_user)
      create_list(:user, 2)
      visit root_path
    end

    it 'Prompts search results after search' do
    end

    it 'Opens the user profile when clicking on the user navbar icon' do
    end

    it 'Opens the friend requests views' do
    end
  end
end
