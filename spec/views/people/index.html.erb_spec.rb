require 'rails_helper'

RSpec.describe "people/index", type: :view do
  before(:each) do
    assign(:people, [
      Person.create!(
        id: 2,
        name: "Name",
        class_year: "Class Year",
        membership_length: "Membership Length",
        companyID: "Company"
      ),
      Person.create!(
        id: 2,
        name: "Name",
        class_year: "Class Year",
        membership_length: "Membership Length",
        companyID: "Company"
      )
    ])
  end

  it "renders a list of people" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Class Year".to_s, count: 2
    assert_select "tr>td", text: "Membership Length".to_s, count: 2
    assert_select "tr>td", text: "Company".to_s, count: 2
  end
end
