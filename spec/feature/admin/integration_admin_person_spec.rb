# frozen_string_literal: true

require 'rails_helper'
#
# This tests the ability to perform crud action on 'people' through admin pages
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

     it 'add a person' do
          visit people_path
          click_on 'New Person'
          fill_in 'person_name', with: 'david'
          fill_in 'person_class_year', with: 'test'
          fill_in 'person_membership_length', with: 'test'
          click_on 'Create Person'
          expect(:notice).to(be_present)
          visit people_path
          expect(page).to(have_content('david'))
     end

     it 'add a person with bad param' do
          visit people_path
          click_on 'New Person'
          fill_in 'person_name', with: ''
          fill_in 'person_class_year', with: ''
          fill_in 'person_membership_length', with: ''
          click_on 'Create Person'
          expect(page).to(have_content('prohibited this person from being saved'))
     end

     it 'update a person' do
          person = Person.create!(name: 'apple', class_year: 'test', membership_length: 'test')
          visit edit_person_path(person.id)
          fill_in 'person_name', with: 'orange'
          click_on 'Update Person'
          expect(:notice).to(be_present)
          visit people_path
          expect(page).to(have_content('orange'))
     end

     it 'update a person with bad params' do
          person = Person.create!(name: 'apple', class_year: 'test', membership_length: 'test')
          visit edit_person_path(person.id)
          fill_in 'person_name', with: ''
          click_on 'Update Person'
          expect(page).to(have_content('prohibited this person from being saved'))
     end

     it 'delete a person' do
          Person.create!(name: 'apple', class_year: 'test', membership_length: 'test')
          visit people_path
          expect(page).to(have_content('apple'))
          click_on 'Destroy'
          expect(page).not_to(have_content('apple'))
     end

end