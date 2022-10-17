require 'rails_helper'

RSpec.describe "home_pages/edit", type: :view do
  before(:each) do
    @home_page = assign(:home_page, HomePage.create!())
  end

  it "renders the edit home_page form" do
    render

    assert_select "form[action=?][method=?]", home_page_path(@home_page), "post" do
    end
  end
end
