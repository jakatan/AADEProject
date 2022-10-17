require 'rails_helper'

RSpec.describe "officer_pages/show", type: :view do
  before(:each) do
    @officer_page = assign(:officer_page, OfficerPage.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
