require 'rails_helper'

RSpec.describe 'Home page renders', type: :feature do

    scenario 'No alumni' do
        visit home_pages_path
        # click_on 'button text name'
        expect(page).not_to have_content('Tom')
    end

    scenario 'One or more alumni' do
        person = Person.create!(name: 'Tom', class_year: '2020', membership_length: '2')
        alumni = Alumni.create!(graduation_year: '2021', companies_worked: 'Apple', person_id: person.id)
        visit home_pages_path
        # click_on 'button text name'
        expect(page).to have_content('Tom')
    end

    scenario 'No company' do
        visit home_pages_path
        # click_on 'button text name'
        expect(page).not_to have_content('Microsoft')
    end

    scenario 'One or more companies' do
        Company.create!(name: 'Microsoft', website: 'microsoft.com')
        visit home_pages_path
        # click_on 'button text name'
        expect(page).to have_content('Microsoft')
    end
end