# frozen_string_literal: true

require 'rails_helper'

RSpec.describe('Home page renders', type: :feature) do
     it 'No alumni' do
          visit home_pages_path
          # click_on 'button text name'
          expect(page).not_to(have_content('Tom'))
     end

     it 'One or more alumni' do
          person = Person.create!(name: 'Tom', class_year: '2020', email: 'test@test.com', membership_length: '2')
          alumni = Alumni.create!(graduation_year: '2021', person_id: person.id)
          visit home_pages_path
          # click_on 'button text name'
          expect(page).to(have_content('Tom'))
     end

     it 'No company' do
          visit home_pages_path
          # click_on 'button text name'
          expect(page).not_to(have_content('Microsoft'))
     end

     it 'One or more companies' do
          Company.create!(name: 'Microsoft', website: 'microsoft.com')
          visit home_pages_path
          # click_on 'button text name'
          expect(page).to(have_content('Microsoft'))
     end
end
