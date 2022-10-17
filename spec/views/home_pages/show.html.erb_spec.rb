require 'rails_helper'

RSpec.describe "home_pages/show", type: :view do
  before(:each) do
    @home_page = assign(:home_page, HomePage.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
