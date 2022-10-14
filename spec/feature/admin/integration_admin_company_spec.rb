require 'rails_helper'
#
# This tests the ability to perform crud action on 'companies' through admin pages
#
RSpec.describe 'Admin is able to', type: :feature do

  before :all do #Create admin used in mockoauth
    Admin.create!(email: 'test@test.com')
  end

  before do #Log in the admin
    Rails.application.env_config["devise.mapping"] = Devise.mappings[:admin] # If using Devise
    Rails.application.env_config["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
    visit 'admins/sign_in'
    click_on 'Sign in'
  end

  scenario 'add a company' do
    visit companies_path
    click_on 'New Company'
    fill_in 'company_name', with: 'apple'
    fill_in 'company_website', with: 'test'
    click_on 'Create Company'
    expect(:notice).to be_present
    visit companies_path
    expect(page).to have_content('apple')
  end

  after do #Log out the admin
    visit destroy_admin_session_path
  end
end