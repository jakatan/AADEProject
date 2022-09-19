require 'rails_helper'

RSpec.describe "positions/new", type: :view do
  before(:each) do
    assign(:position, Position.new(
      position: "MyString",
      id: 1,
      companyID: 1
    ))
  end

  it "renders new position form" do
    render

    assert_select "form[action=?][method=?]", positions_path, "post" do

      assert_select "input[name=?]", "position[position]"

      assert_select "input[name=?]", "position[id]"

      assert_select "input[name=?]", "position[companyID]"
    end
  end
end
