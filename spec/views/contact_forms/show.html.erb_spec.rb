require 'rails_helper'

RSpec.describe "contact_forms/show", type: :view do
  before(:each) do
    @contact_form = assign(:contact_form, ContactForm.create!(
      contactID: 2,
      email: "Email",
      name: "Name",
      message: "Message"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Message/)
  end
end
