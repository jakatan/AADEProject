require 'rails_helper'

RSpec.describe "people/new", type: :view do
  before(:each) do
    assign(:person, Person.new(
      id: 1,
      name: "MyString",
      class_year: "MyString",
      membership_length: "MyString",
      companyID: "MyString"
    ))
  end

  it "renders new person form" do
    render

    assert_select "form[action=?][method=?]", people_path, "post" do

      assert_select "input[name=?]", "person[id]"

      assert_select "input[name=?]", "person[name]"

      assert_select "input[name=?]", "person[class_year]"

      assert_select "input[name=?]", "person[membership_length]"

      assert_select "input[name=?]", "person[companyID]"
    end
  end
end
