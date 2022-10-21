require 'rails_helper'

RSpec.describe 'Dashboards', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) { build(:user) }

  it 'loads the dashboard#index page with the SomnianT logo, when user is logged in' do
    login_as(user)
    visit root_path

    expect(page).to have_content('SomnianT')
    expect(page).to have_content('Discover')
    expect(page).to have_content('Dashboard')
  end

  it 'does not load the dashboard#index page, redirects to landing page, when user is not logged in ' do
    visit root_path

    expect(page).to have_content('SomnianT')
    expect(page).to have_content('Create New Account')
    expect(page).to have_content('Forgotten password')
  end
end
