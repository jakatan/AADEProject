require 'rails_helper'

RSpec.describe "companies/edit", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      companyID: 1,
      companyName: "MyString",
      company_website: "MyString"
    ))
  end

  it "renders the edit company form" do
    render

    assert_select "form[action=?][method=?]", company_path(@company), "post" do

      assert_select "input[name=?]", "company[companyID]"

      assert_select "input[name=?]", "company[companyName]"

      assert_select "input[name=?]", "company[company_website]"
    end
  end
end
