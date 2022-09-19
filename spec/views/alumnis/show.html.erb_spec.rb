require 'rails_helper'

RSpec.describe "alumnis/show", type: :view do
  before(:each) do
    @alumni = assign(:alumni, Alumni.create!(
      graduation_year: "Graduation Year",
      companies_worked: "Companies Worked",
      companyID: "Company"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Graduation Year/)
    expect(rendered).to match(/Companies Worked/)
    expect(rendered).to match(/Company/)
  end
end
