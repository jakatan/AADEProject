require 'rails_helper'

RSpec.describe "alumnis/edit", type: :view do
  before(:each) do
    @alumni = assign(:alumni, Alumni.create!(
      graduation_year: "MyString",
      companies_worked: "MyString",
      companyID: "MyString"
    ))
  end

  it "renders the edit alumni form" do
    render

    assert_select "form[action=?][method=?]", alumni_path(@alumni), "post" do

      assert_select "input[name=?]", "alumni[graduation_year]"

      assert_select "input[name=?]", "alumni[companies_worked]"

      assert_select "input[name=?]", "alumni[companyID]"
    end
  end
end
