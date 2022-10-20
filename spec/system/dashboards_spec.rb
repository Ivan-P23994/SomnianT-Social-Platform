require 'rails_helper'
include ActiveStorage::Blob::Analyzable

RSpec.describe "Dashboards", type: :system do
  before do
    driven_by(:rack_test)
  end

  let(:user) { build(:user) }

  it "loads the index page with the SomnianT logo" do
    login_as(user)
    visit root_path

    expect(page).to have_content("SomnianT")
  end
end
