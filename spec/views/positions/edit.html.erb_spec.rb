require 'rails_helper'

RSpec.describe "positions/edit", type: :view do
  before(:each) do
    @position = assign(:position, Position.create!(
      position: "MyString",
      id: 1,
      companyID: 1
    ))
  end

  it "renders the edit position form" do
    render

    assert_select "form[action=?][method=?]", position_path(@position), "post" do

      assert_select "input[name=?]", "position[position]"

      assert_select "input[name=?]", "position[id]"

      assert_select "input[name=?]", "position[companyID]"
    end
  end
end
