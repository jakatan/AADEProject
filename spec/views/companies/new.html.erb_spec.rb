require 'rails_helper'

RSpec.describe "companies/new", type: :view do
  before(:each) do
    assign(:company, Company.new(
      companyID: 1,
      companyName: "MyString",
      company_website: "MyString"
    ))
  end

  it "renders new company form" do
    render

    assert_select "form[action=?][method=?]", companies_path, "post" do

      assert_select "input[name=?]", "company[companyID]"

      assert_select "input[name=?]", "company[companyName]"

      assert_select "input[name=?]", "company[company_website]"
    end
  end
end
