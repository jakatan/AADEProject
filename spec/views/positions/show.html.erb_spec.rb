require 'rails_helper'

RSpec.describe "positions/show", type: :view do
  before(:each) do
    @position = assign(:position, Position.create!(
      position: "Position",
      id: 2,
      companyID: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Position/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
