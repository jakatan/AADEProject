require 'rails_helper'

RSpec.describe "people/edit", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      id: 1,
      name: "MyString",
      class_year: "MyString",
      membership_length: "MyString",
      companyID: "MyString"
    ))
  end

  it "renders the edit person form" do
    render

    assert_select "form[action=?][method=?]", person_path(@person), "post" do

      assert_select "input[name=?]", "person[id]"

      assert_select "input[name=?]", "person[name]"

      assert_select "input[name=?]", "person[class_year]"

      assert_select "input[name=?]", "person[membership_length]"

      assert_select "input[name=?]", "person[companyID]"
    end
  end
end
