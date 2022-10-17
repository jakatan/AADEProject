require 'rails_helper'

RSpec.describe 'Officer page renders', type: :feature do

    scenario 'No officers' do
        visit officer_page_path
        # click_on 'button text name'
        expect(page).not_to have_content('Stephen Perry')
    end

    scenario 'One officer' do
        person = Person.create!(name: 'Stephen Perry', class_year: '2023', membership_length: '2')
        officer = Officer.create!(position: 'President', person_id: person.id, email: 'sjperry1999@tamu.edu', year_elected: '2022', description: 'Petroleum Engineering')
        visit officer_page_path
        # click_on 'button text name'
        expect(page).to have_content('Stephen Perry')
    end

    scenario 'One or more officers' do
        person = Person.create!(name: 'Stephen Perry', class_year: '2023', membership_length: '2')
        officer = Officer.create!(position: 'President', person_id: person.id, email: 'sjperry1999@tamu.edu', year_elected: '2022', description: 'Petroleum Engineering')
        person = Person.create!(name: 'Aakash Verma', class_year: '2023', membership_length: '1')
        officer = Officer.create!(position: 'Vice President External', person_id: person.id, email: 'aakash25@tamu.edu', year_elected: '2022', description: 'Petroleum Engineering')
        visit officer_page_path
        # click_on 'button text name'
        expect(page).to have_content('Stephen Perry')
        expect(page).to have_content('Aakash Verma')

    end
end