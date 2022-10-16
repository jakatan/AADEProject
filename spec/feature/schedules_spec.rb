require 'rails_helper'

RSpec.describe 'Schedule page', type: :feature do
    scenario 'going to schedules page' do
      visit home_pages_path
      click_on 'Schedule'
      expect(page).to have_content('Upcoming Events')
    end	
end