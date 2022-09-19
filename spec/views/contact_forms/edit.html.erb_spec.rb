require 'rails_helper'

RSpec.describe "contact_forms/edit", type: :view do
  before(:each) do
    @contact_form = assign(:contact_form, ContactForm.create!(
      contactID: 1,
      email: "MyString",
      name: "MyString",
      message: "MyString"
    ))
  end

  it "renders the edit contact_form form" do
    render

    assert_select "form[action=?][method=?]", contact_form_path(@contact_form), "post" do

      assert_select "input[name=?]", "contact_form[contactID]"

      assert_select "input[name=?]", "contact_form[email]"

      assert_select "input[name=?]", "contact_form[name]"

      assert_select "input[name=?]", "contact_form[message]"
    end
  end
end
