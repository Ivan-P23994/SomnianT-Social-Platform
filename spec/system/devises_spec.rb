require 'rails_helper'

RSpec.describe 'Devise resources and routes', type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) { build(:user) }

  describe 'Session / Log in page' do
    before { create_list(:user, 2) }

    it 'Loads the log in page' do
      visit root_path

      expect(page).to have_content('SomnianT')
      expect(page).to have_content('Create New Account')
      expect(page).to have_content('Forgotten password')
    end

    it 'Redirects to user dashboard, when user is logged in' do
      login_as(user)
      visit root_path

      expect(page).to have_content('SomnianT')
      expect(page).to have_content('Discover')
      expect(page).to have_content('Dashboard')
    end

    it 'Redirects to user dashboard, when user logs in' do
      visit root_path

      fill_in 'Email address', with: user.email.to_s
      fill_in 'Password', with: '123456'
      click_on 'Log in'

      expect(page).to have_content('SomnianT')
      expect(page).to have_content('Discover')
      expect(page).to have_content('Dashboard')
    end

    it 'does not redirect to user dashboard, when user uses invalid log in credentials' do
      visit root_path

      fill_in 'Email address', with: user.email.to_s
      fill_in 'Password', with: nil
      click_on 'Log in'

      expect(page).to have_content('SomnianT')
      expect(page).to have_content('Create New Account')
      expect(page).to have_content('Forgotten password')
    end

    it 'Opens the user creation view when Create New Account is clicked' do
      visit root_path
      click_on 'Create New Account'

      expect(page).to have_content('Sign up')
      expect(page).to have_content("It's quick and easy.")
    end

    it 'Opens the user creation view when Add Account is clicked' do
      visit root_path
      click_link('Add Account')

      expect(page).to have_content('Sign up')
      expect(page).to have_content("It's quick and easy.")
    end
  end

  describe 'User create page' do
    before { create_list(:user, 2) }

    it 'Creates and redirects user to his dashboard' do
      visit new_user_registration_path

      fill_in 'First name', with: 'Johnny'
      fill_in 'Surname', with: 'Doe'
      fill_in 'E-mail', with: 'JohnnyDoe@testexample.com'
      fill_in 'user_password', with: '123456'
      choose(option: 'female')

      click_on 'Sign up'

      expect(page).to have_content('SomnianT')
      expect(page).to have_content('Discover')
      expect(page).to have_content('Dashboard')
    end

    it 'Does not create an user and redirect' do
      visit new_user_registration_path
      click_on 'Sign up'

      expect(page).to have_content('Sign up')
      expect(page).to have_content("It's quick and easy.")
    end

    it 'returns to login page after we click on the SomnianT logo' do
      visit new_user_registration_path
      click_on 'SomnianT'

      expect(page).to have_content('SomnianT')
      expect(page).to have_content('Create New Account')
      expect(page).to have_content('Forgotten password')
    end
  end
end