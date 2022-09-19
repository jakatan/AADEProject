require 'rails_helper'

RSpec.describe "alumnis/index", type: :view do
  before(:each) do
    assign(:alumnis, [
      Alumni.create!(
        graduation_year: "Graduation Year",
        companies_worked: "Companies Worked",
        companyID: "Company"
      ),
      Alumni.create!(
        graduation_year: "Graduation Year",
        companies_worked: "Companies Worked",
        companyID: "Company"
      )
    ])
  end

  it "renders a list of alumnis" do
    render
    assert_select "tr>td", text: "Graduation Year".to_s, count: 2
    assert_select "tr>td", text: "Companies Worked".to_s, count: 2
    assert_select "tr>td", text: "Company".to_s, count: 2
  end
end
