# frozen_string_literal: true

require 'rails_helper'
#
# This tests the ability to perform crud action on 'alumni' through admin pages
#
RSpec.describe('Admin is able to', type: :feature) do
     before :all do # Create admin used in mockoauth
          @person = Person.create!(name: 'admin', class_year: 'n/a',
                                   membership_length: 'n/a', email: 'test@test.com', is_admin: true)
     end

     before do # Log in the admin
          Rails.application.env_config['devise.mapping'] = Devise.mappings[:admin] # If using Devise
          Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
          visit 'admins/sign_in'
          click_on 'Sign in'
     end

     after :all do
          @person.destroy!
     end

     after do # Log out the admin
          visit destroy_person_session_path
     end

     it 'add an alumni' do
          Person.create!(name: 'TestPerson', class_year: '2023', email: 'test@gmail.com', membership_length: '20 years')
          visit alumnis_path
          click_on 'New Alumni'
          fill_in 'alumni_graduation_year', with: '2022'
          select 'TestPerson', from: 'alumni_person_id'
          click_on 'Create Alumni'
          expect(:notice).to(be_present)
          visit alumnis_path
          expect(page).to(have_content('TestPerson'))
     end

     it 'add an alumni with bad param' do
          Person.create!(name: 'TestPerson', class_year: '2023', email: 'test@gmail.com', membership_length: '20 years')
          visit alumnis_path
          click_on 'New Alumni'
          click_on 'Create Alumni'
          expect(page).to(have_content('prohibited this alumni from being saved'))
     end

     it 'update an alumni' do
          person = Person.create!(name: 'TestPerson', class_year: '2023', email: 'test@gmail.com', membership_length: '20 years')
          alumni = Alumni.create!(graduation_year: '2022', person_id: person.id)
          visit edit_alumni_path(alumni.id)
          fill_in 'alumni_graduation_year', with: 'testyear'
          select 'TestPerson', from: 'alumni_person_id'
          click_on 'Update Alumni'
          expect(:notice).to(be_present)
          visit alumnis_path
          expect(page).to(have_content('testyear'))
     end

     it 'update an alumni with bad param' do
          person = Person.create!(name: 'TestPerson', class_year: '2023', email: 'test@gmail.com', membership_length: '20 years')
          alumni = Alumni.create!(graduation_year: '2022', person_id: person.id)
          visit edit_alumni_path(alumni.id)
          fill_in 'alumni_graduation_year', with: ''
          select 'TestPerson', from: 'alumni_person_id'
          click_on 'Update Alumni'
          expect(page).to(have_content('prohibited this alumni from being saved'))
     end

     it 'delete an alumni' do
          person = Person.create!(name: 'TestPerson', class_year: '2023', email: 'test@gmail.com', membership_length: '20 years')
          alumni = Alumni.create!(graduation_year: '2022', person_id: person.id)
          visit alumnis_path
          expect(page).to(have_content('TestPerson'))
          click_on 'Destroy'
          expect(page).not_to(have_content('TestPerson'))
     end
end
