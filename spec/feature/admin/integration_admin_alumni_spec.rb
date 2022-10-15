# frozen_string_literal: true

require 'rails_helper'
#
# This tests the ability to perform crud action on 'alumni' through admin pages
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

     it 'add an alumni' do
          Person.create!(name: 'TestPerson', class_year: '2023', membership_length: '20 years')
          visit alumnis_path
          click_on 'New Alumni'
          fill_in 'alumni_graduation_year', with: '2022'
          fill_in 'alumni_companies_worked', with: 'apple'
          select 'TestPerson', from: 'alumni_person_id'
          click_on 'Create Alumni'
          expect(:notice).to(be_present)
          visit alumnis_path
          expect(page).to(have_content('TestPerson'))
     end

     it 'update an alumni' do
          person = Person.create!(name: 'TestPerson', class_year: '2023', membership_length: '20 years')
          alumni = Alumni.create!(graduation_year: '2022', companies_worked: 'apple', person_id: person.id)
          visit edit_alumni_path(alumni.id)
          fill_in 'alumni_graduation_year', with: '2'
          fill_in 'alumni_companies_worked', with: 'orange'
          select 'TestPerson', from: 'alumni_person_id'
          click_on 'Update Alumni'
          expect(:notice).to(be_present)
          visit alumnis_path
          expect(page).to(have_content('orange'))
     end
end
