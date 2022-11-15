require 'rails_helper'

RSpec.describe 'Admin is able to', type: :feature do
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

    scenario 'change the email with valid email (.edu extension)' do
        visit admins_path
        fill_in "address", with: 'a.valid.email@tamu.edu'
        click_on "Change Email"
        expect(page).to(have_content("Email has been successfully changed"))
        expect($calendar_email).to eql('a.valid.email@tamu.edu')
    end	

    scenario 'change the email with valid email (.com extension)' do
        visit admins_path
        fill_in "address", with: 'a.valid.email@gmail.com'
        click_on "Change Email"
        expect(page).to(have_content("Email has been successfully changed"))
        expect($calendar_email).to eql('a.valid.email@gmail.com')
    end	

    scenario 'not change the email with blank email' do
        visit admins_path
        click_on "Change Email"
        expect(page).to(have_content("Must provide an email"))
        expect($calendar_email).to_not eql('')      
    end

    scenario 'not change the email with invalid email (has no extension)' do 
        visit admins_path
        fill_in "address", with: "email.without@extension"
        click_on "Change Email"
        expect(page).to(have_content("Must provide a valid email with proper extension"))
        expect($calendar_email).to_not eql('email.without@extension')      
    end
end