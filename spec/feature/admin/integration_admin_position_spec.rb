# frozen_string_literal: true

require 'rails_helper'
#
# This tests the ability to perform crud action on 'positions' through admin pages
#
RSpec.describe('Admin is able to', type: :feature) do

     before :all do # Create admin used in mockoauth
          @person = Person.create!(name: 'TestPerson', class_year: '2023',
                                   membership_length: '20 years', email: 'test@test.com', is_admin: true)
          @company = Company.create!(name: 'apple', website: 'test')
     end

     before do # Log in the admin
          Rails.application.env_config['devise.mapping'] = Devise.mappings[:admin] # If using Devise
          Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
          visit 'admins/sign_in'
          click_on 'Sign in'
     end

     after :all do
          @person.destroy!
          @company.destroy!
     end

     after do # Log out the admin
          visit destroy_person_session_path
     end

     it 'add a position' do
          visit positions_path
          click_on 'New Position'
          select 'TestPerson', from: 'position_person_id'
          select 'apple', from: 'position_company_id'
          fill_in 'position_position', with: 'engineer'
          click_on 'Create Position'
          expect(:notice).to(be_present)
          visit positions_path
          expect(page).to(have_content('TestPerson'))
     end

     it 'add a position with bad param' do
          visit positions_path
          click_on 'New Position'

          click_on 'Create Position'
          expect(page).to(have_content('prohibited this position from being saved'))
     end

     it 'update a position' do
          position = Position.create!(position: 'engineer', person_id: @person.id, company_id: @company.id)
          visit edit_position_path(position.id)
          fill_in 'position_position', with: 'tester'
          click_on 'Update Position'
          expect(:notice).to(be_present)
          visit positions_path
          expect(page).to(have_content('tester'))
     end

     it 'update a position with bad params' do
          position = Position.create!(position: 'engineer', person_id: @person.id, company_id: @company.id)
          visit edit_position_path(position.id)
          fill_in 'position_position', with: ''
          click_on 'Update Position'
          expect(page).to(have_content('prohibited this position from being saved'))
     end

     it 'delete a person' do
          Position.create!(position: 'engineer', person_id: @person.id, company_id: @company.id)
          visit positions_path
          expect(page).to(have_content('engineer'))
          click_on 'Destroy'
          expect(page).not_to(have_content('engineer'))
     end

end