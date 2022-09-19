require 'rails_helper'

RSpec.describe "officers/new", type: :view do
  before(:each) do
    assign(:officer, Officer.new(
      position: "MyString",
      email: "MyString",
      companyID: 1,
      year_elected: "MyString",
      description: "MyString",
      photo: "MyString",
      officer_id: 1
    ))
  end

  it "renders new officer form" do
    render

    assert_select "form[action=?][method=?]", officers_path, "post" do

      assert_select "input[name=?]", "officer[position]"

      assert_select "input[name=?]", "officer[email]"

      assert_select "input[name=?]", "officer[companyID]"

      assert_select "input[name=?]", "officer[year_elected]"

      assert_select "input[name=?]", "officer[description]"

      assert_select "input[name=?]", "officer[photo]"

      assert_select "input[name=?]", "officer[officer_id]"
    end
  end
end
