require 'rails_helper'

RSpec.describe 'Navbar test', type: :feature do

    scenario 'Home Page to other Pages' do
        visit home_pages_path
        page.should have_link('Schedule')
        page.should have_link('Officer Page')
    end

    scenario 'Schedule Page to other Pages' do
        visit schedules_path
        page.should have_link('Home')
        page.should have_link('Officer Page')
    end

    scenario 'Officer Page to other Pages' do
        visit officer_pages_path
        page.should have_link('Schedule')
        page.should have_link('Home')
    end

end