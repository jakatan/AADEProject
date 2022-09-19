require 'rails_helper'

RSpec.describe "officers/edit", type: :view do
  before(:each) do
    @officer = assign(:officer, Officer.create!(
      position: "MyString",
      email: "MyString",
      companyID: 1,
      year_elected: "MyString",
      description: "MyString",
      photo: "MyString",
      officer_id: 1
    ))
  end

  it "renders the edit officer form" do
    render

    assert_select "form[action=?][method=?]", officer_path(@officer), "post" do

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
