require 'rails_helper'

RSpec.describe 'Schedule page -', type: :feature do
    scenario 'going to schedule page' do
      visit home_pages_path
      click_on 'Schedule'
      expect(page).to have_content('Upcoming Events')
    end	
    
    scenario 'calendar is loaded and displayed' do
      visit schedules_path
      # Link helped with comparing the src from iframe: https://stackoverflow.com/questions/6477051/how-do-i-test-an-image-src-and-alt-value-using-capybara
      expect(page.find('#calendar-iframe')['src']).to have_content('https://calendar.google.com/calendar/embed?src='+$calendar_email+'&ctz=America%2FChicago')
    end
end