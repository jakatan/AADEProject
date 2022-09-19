require 'rails_helper'

RSpec.describe "contact_forms/index", type: :view do
  before(:each) do
    assign(:contact_forms, [
      ContactForm.create!(
        contactID: 2,
        email: "Email",
        name: "Name",
        message: "Message"
      ),
      ContactForm.create!(
        contactID: 2,
        email: "Email",
        name: "Name",
        message: "Message"
      )
    ])
  end

  it "renders a list of contact_forms" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: "Message".to_s, count: 2
  end
end
