require 'rails_helper'

RSpec.describe "contact_forms/new", type: :view do
  before(:each) do
    assign(:contact_form, ContactForm.new(
      contactID: 1,
      email: "MyString",
      name: "MyString",
      message: "MyString"
    ))
  end

  it "renders new contact_form form" do
    render

    assert_select "form[action=?][method=?]", contact_forms_path, "post" do

      assert_select "input[name=?]", "contact_form[contactID]"

      assert_select "input[name=?]", "contact_form[email]"

      assert_select "input[name=?]", "contact_form[name]"

      assert_select "input[name=?]", "contact_form[message]"
    end
  end
end
