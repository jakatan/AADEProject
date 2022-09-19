require 'rails_helper'

RSpec.describe "companies/show", type: :view do
  before(:each) do
    @company = assign(:company, Company.create!(
      companyID: 2,
      companyName: "Company Name",
      company_website: "Company Website"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Company Name/)
    expect(rendered).to match(/Company Website/)
  end
end
