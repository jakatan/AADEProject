require 'rails_helper'

RSpec.describe "home_pages/new", type: :view do
  before(:each) do
    assign(:home_page, HomePage.new())
  end

  it "renders new home_page form" do
    render

    assert_select "form[action=?][method=?]", home_pages_path, "post" do
    end
  end
end
