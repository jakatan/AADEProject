require 'rails_helper'

RSpec.describe "alumnis/new", type: :view do
  before(:each) do
    assign(:alumni, Alumni.new(
      graduation_year: "MyString",
      companies_worked: "MyString",
      companyID: "MyString"
    ))
  end

  it "renders new alumni form" do
    render

    assert_select "form[action=?][method=?]", alumnis_path, "post" do

      assert_select "input[name=?]", "alumni[graduation_year]"

      assert_select "input[name=?]", "alumni[companies_worked]"

      assert_select "input[name=?]", "alumni[companyID]"
    end
  end
end
