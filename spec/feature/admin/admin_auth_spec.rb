# frozen_string_literal: true

require 'rails_helper'
#
# This tests that only a logged in admin is able to access certain pages
#
RSpec.describe('Access without admin login - ', type: :feature) do
     search_text = 'Sign in'

     it 'access admin company pages is denied' do
          visit companies_path
          expect(page).to(have_content(search_text))

          visit new_company_path
          expect(page).to(have_content(search_text))

          visit edit_company_path(1)
          expect(page).to(have_content(search_text))

          visit company_path(1)
          expect(page).to(have_content(search_text))
     end

     it 'admin person pages is denied' do
          visit people_path
          expect(page).to(have_content(search_text))

          visit new_person_path
          expect(page).to(have_content(search_text))

          visit edit_person_path(1)
          expect(page).to(have_content(search_text))

          visit person_path(1)
          expect(page).to(have_content(search_text))
     end

     it 'admin officer pages is denied' do
          visit officers_path
          expect(page).to(have_content(search_text))

          visit new_officer_path
          expect(page).to(have_content(search_text))

          visit edit_officer_path(1)
          expect(page).to(have_content(search_text))

          visit officer_path(1)
          expect(page).to(have_content(search_text))
     end

     it 'admin alumni pages is denied' do
          visit alumnis_path
          expect(page).to(have_content(search_text))

          visit new_alumni_path
          expect(page).to(have_content(search_text))

          visit edit_alumni_path(1)
          expect(page).to(have_content(search_text))

          visit alumni_path(1)
          expect(page).to(have_content(search_text))
     end

     it 'admin postion pages is denied' do
          visit positions_path
          expect(page).to(have_content(search_text))

          visit new_position_path
          expect(page).to(have_content(search_text))

          visit edit_position_path(1)
          expect(page).to(have_content(search_text))

          visit position_path(1)
          expect(page).to(have_content(search_text))
     end

     it 'admin contact form pages is denied' do
          visit contact_forms_path
          expect(page).to(have_content(search_text))

          # New access is not restricted due to public users needing to be able to submit
          visit new_contact_form_path
          expect(page).to(have_content(search_text))

     end
end

RSpec.describe('Access with admin login - ', type: :feature) do
     before :all do
          @search_text = 'Sign in'
          @person = Person.create!(name: 'TestPerson', class_year: '2023', membership_length: '20 years')
          @officer = Officer.create!(person_id: @person.id, position: 'lead', email: 'test', year_elected: 'test',
                                     description: 'test'
          )
          @alumni = Alumni.create!(graduation_year: '2022', companies_worked: 'TAMU', person_id: @person.id)
          @contact_form = ContactForm.create!(person_id: @person.id, email: 'test', name: 'test', message: 'test')
          @company = Company.create!(name: 'TAMU', website: 'www.website.com')
          @position = Position.create!(position: 'leader', person_id: @person.id, company_id: @company.id)
          Admin.create!(email: 'test@test.com')
     end

     before do
          Rails.application.env_config['devise.mapping'] = Devise.mappings[:admin] # If using Devise
          Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
          visit 'admins/sign_in'
          click_on 'Sign in'
     end

     after :all do
          @person.destroy!
          @officer.destroy!
          @contact_form.destroy!
          @company.destroy!
          @alumni.destroy!
     end

     after do
          visit destroy_admin_session_path
     end

     it 'admin company pages is allowed' do
          visit companies_path
          expect(page).not_to(have_content(@search_text))

          visit new_company_path
          expect(page).not_to(have_content(@search_text))

          visit edit_company_path(@company)
          expect(page).not_to(have_content(@search_text))

          visit company_path(@company)
          expect(page).not_to(have_content(@search_text))
     end

     it 'admin person pages is allowed' do
          visit people_path
          expect(page).not_to(have_content(@search_text))

          visit new_person_path
          expect(page).not_to(have_content(@search_text))

          visit edit_person_path(@person)
          expect(page).not_to(have_content(@search_text))

          visit person_path(@person)
          expect(page).not_to(have_content(@search_text))
     end

     it 'access admin officer pages is allowed' do
          visit officers_path
          expect(page).not_to(have_content(@search_text))

          visit new_officer_path
          expect(page).not_to(have_content(@search_text))

          visit edit_officer_path(@officer)
          expect(page).not_to(have_content(@search_text))

          visit officer_path(@officer)
          expect(page).not_to(have_content(@search_text))
     end

     it 'access admin alumni pages is allowed' do
          visit alumnis_path
          expect(page).not_to(have_content(@search_text))

          visit new_alumni_path
          expect(page).not_to(have_content(@search_text))

          visit edit_alumni_path(@alumni)
          expect(page).not_to(have_content(@search_text))

          visit alumni_path(@alumni)
          expect(page).not_to(have_content(@search_text))
     end

     it 'access admin postion pages is allowed' do
          visit positions_path
          expect(page).not_to(have_content(@search_text))

          visit new_position_path
          expect(page).not_to(have_content(@search_text))

          visit edit_position_path(@position)
          expect(page).not_to(have_content(@search_text))

          visit position_path(@position)
          expect(page).not_to(have_content(@search_text))
     end

     it 'access admin contact form pages is allowed' do
          visit contact_forms_path
          expect(page).not_to(have_content(@search_text))

          # New access is not restricted due to public users needing to be able to submit
          visit new_contact_form_path
          expect(page).not_to(have_content(@search_text))

          visit edit_contact_form_path(@contact_form)
          expect(page).not_to(have_content(@search_text))

          visit contact_form_path(@contact_form)
          expect(page).not_to(have_content(@search_text))
     end
end
