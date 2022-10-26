# frozen_string_literal: true

require 'rails_helper'
#
# This tests the ability to perform crud action on 'contact_forms' through admin pages
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

     #
     # Adding a contact form is done through the officer page
     #

     #
     # No one should be able to edit the contact forms
     #

     it 'delete a contact form' do
          contact_form = ContactForm.create!(person_id: 'test', email: 'test', name: 'test', message: 'test')
          visit contact_forms_path
          expect(page).to(have_content('test'))
          click_on 'Destroy'
          expect(page).not_to(have_content('test'))
     end

end
