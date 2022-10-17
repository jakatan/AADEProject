require 'rails_helper'

RSpec.describe "officer_pages/edit", type: :view do
  before(:each) do
    @officer_page = assign(:officer_page, OfficerPage.create!())
  end

  it "renders the edit officer_page form" do
    render

    assert_select "form[action=?][method=?]", officer_page_path(@officer_page), "post" do
    end
  end
end
