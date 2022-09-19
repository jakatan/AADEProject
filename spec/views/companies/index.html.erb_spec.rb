require 'rails_helper'

RSpec.describe "companies/index", type: :view do
  before(:each) do
    assign(:companies, [
      Company.create!(
        companyID: 2,
        companyName: "Company Name",
        company_website: "Company Website"
      ),
      Company.create!(
        companyID: 2,
        companyName: "Company Name",
        company_website: "Company Website"
      )
    ])
  end

  it "renders a list of companies" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Company Name".to_s, count: 2
    assert_select "tr>td", text: "Company Website".to_s, count: 2
  end
end
