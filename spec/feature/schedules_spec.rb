require 'rails_helper'

RSpec.describe 'Schedule page', type: :feature do
    scenario 'going to schedules page' do
      # Go to Home page
      visit home_pages_path

      # Click on the Schedules
      click_on 'Schedule'

      # Expect to see "Upcoming Events"
      expect(page).to have_content('Upcoming Events')
      
    end	
end