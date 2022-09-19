require 'rails_helper'

RSpec.describe "people/show", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      id: 2,
      name: "Name",
      class_year: "Class Year",
      membership_length: "Membership Length",
      companyID: "Company"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Class Year/)
    expect(rendered).to match(/Membership Length/)
    expect(rendered).to match(/Company/)
  end
end
