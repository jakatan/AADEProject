# frozen_string_literal: true

require 'rails_helper'
#
# This tests the ability to perform crud action on 'alumni' through admin pages
#
RSpec.describe('Admin is able to', type: :feature) do

     before :all do # Create admin used in mockoauth
          @person = Person.create!(name: 'TestPerson', class_year: '2023', membership_length: '20 years')
          Admin.create!(email: 'test@test.com')
     end

     before do # Log in the admin
          Rails.application.env_config['devise.mapping'] = Devise.mappings[:admin] # If using Devise
          Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
          visit 'admins/sign_in'
          click_on 'Sign in'
     end

     after :all do
          @person.destroy
     end

     after do # Log out the admin
          visit destroy_admin_session_path
     end

     it 'add an officer' do
          visit officers_path
          click_on 'New Officer'
          fill_in 'officer_position', with: 'lead'
          fill_in 'officer_email', with: 'test@test.com'
          fill_in 'officer_year_elected', with: '2022'
          fill_in 'officer_description', with: 'this is a description'
          select 'TestPerson', from: 'officer_person_id'
          click_on 'Create Officer'
          expect(:notice).to(be_present)
          visit officers_path
          expect(page).to(have_content('TestPerson'))
     end

     it 'not add an officer with bad param' do
          visit officers_path
          click_on 'New Officer'
          fill_in 'officer_position', with: ''
          click_on 'Create Officer'
          expect(page).to(have_content('prohibited this officer from being saved'))
     end

     it 'update an officer' do
          officer = Officer.create!(position: 'lead', email: 'test@test.com', description: 'this is a description',
                                    year_elected: '2022', person_id: @person.id)
          visit edit_officer_path(officer.id)
          fill_in 'officer_position', with: 'orange'
          fill_in 'officer_email', with: 'test@test.com'
          fill_in 'officer_year_elected', with: '2022'
          select 'TestPerson', from: 'officer_person_id'
          click_on 'Update Officer'
          expect(:notice).to(be_present)
          visit officers_path
          expect(page).to(have_content('orange'))
     end

     it 'not update an officer with bad param' do
          officer = Officer.create!(position: 'lead', email: 'test@test.com', description: 'this is a description',
                                    year_elected: '2022', person_id: @person.id)
          visit edit_officer_path(officer.id)
          fill_in 'officer_position', with: ''
          click_on 'Update Officer'
          expect(page).to(have_content('prohibited this officer from being saved'))
     end

     it 'delete an officer' do
          Officer.create!(position: 'lead', email: 'test@test.com', description: 'this is a description',
                          year_elected: '2022', person_id: @person.id)
          visit officers_path
          expect(page).to(have_content('TestPerson'))
          click_on 'Destroy'
          expect(page).not_to(have_content('TestPerson'))
     end
end
