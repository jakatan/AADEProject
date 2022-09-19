require 'rails_helper'

RSpec.describe "positions/index", type: :view do
  before(:each) do
    assign(:positions, [
      Position.create!(
        position: "Position",
        id: 2,
        companyID: 3
      ),
      Position.create!(
        position: "Position",
        id: 2,
        companyID: 3
      )
    ])
  end

  it "renders a list of positions" do
    render
    assert_select "tr>td", text: "Position".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
