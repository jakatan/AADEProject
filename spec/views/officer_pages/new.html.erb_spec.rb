require 'rails_helper'

RSpec.describe "officer_pages/new", type: :view do
  before(:each) do
    assign(:officer_page, OfficerPage.new())
  end

  it "renders new officer_page form" do
    render

    assert_select "form[action=?][method=?]", officer_pages_path, "post" do
    end
  end
end
