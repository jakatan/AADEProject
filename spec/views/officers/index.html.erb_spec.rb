require 'rails_helper'

RSpec.describe "officers/index", type: :view do
  before(:each) do
    assign(:officers, [
      Officer.create!(
        position: "Position",
        email: "Email",
        companyID: 2,
        year_elected: "Year Elected",
        description: "Description",
        photo: "Photo",
        officer_id: 3
      ),
      Officer.create!(
        position: "Position",
        email: "Email",
        companyID: 2,
        year_elected: "Year Elected",
        description: "Description",
        photo: "Photo",
        officer_id: 3
      )
    ])
  end

  it "renders a list of officers" do
    render
    assert_select "tr>td", text: "Position".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Year Elected".to_s, count: 2
    assert_select "tr>td", text: "Description".to_s, count: 2
    assert_select "tr>td", text: "Photo".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
