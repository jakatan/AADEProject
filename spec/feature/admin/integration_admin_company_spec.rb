# frozen_string_literal: true

require 'rails_helper'
#
# This tests the ability to perform crud action on 'companies' through admin pages
#
RSpec.describe('Admin is able to', type: :feature) do
     before :all do # Create admin used in mockoauth
          Admin.create!(email: 'test@test.com')
     end

     before do # Log in the admin
          Rails.application.env_config['devise.mapping'] = Devise.mappings[:admin] # If using Devise
          Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
          visit 'admins/sign_in'
          click_on 'Sign in'
     end

     after do # Log out the admin
          visit destroy_admin_session_path
     end

     it 'add a company' do
          visit companies_path
          click_on 'New Company'
          fill_in 'company_name', with: 'apple'
          fill_in 'company_website', with: 'test'
          click_on 'Create Company'
          expect(:notice).to(be_present)
          visit companies_path
          expect(page).to(have_content('apple'))
     end

     it 'add a company with bad param' do
          visit companies_path
          click_on 'New Company'
          fill_in 'company_name', with: ''
          fill_in 'company_website', with: ''
          click_on 'Create Company'
          expect(page).to(have_content('prohibited this company from being saved'))
     end

     it 'update a company' do
          company = Company.create!(name: 'apple', website: 'test')
          visit edit_company_path(company.id)
          fill_in 'company_name', with: 'orange'
          click_on 'Update Company'
          expect(:notice).to(be_present)
          visit companies_path
          expect(page).to(have_content('orange'))
     end

     it 'update a company with bad params' do
          company = Company.create!(name: 'apple', website: 'test')
          visit edit_company_path(company.id)
          fill_in 'company_name', with: ''
          click_on 'Update Company'
          expect(page).to(have_content('prohibited this company from being saved'))
     end

     it 'delete a company' do
          Company.create!(name: 'apple', website: 'test')
          visit companies_path
          expect(page).to(have_content('apple'))
          click_on 'Destroy'
          expect(page).not_to(have_content('apple'))
     end

end
