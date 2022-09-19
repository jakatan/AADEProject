require 'rails_helper'

RSpec.describe "officers/show", type: :view do
  before(:each) do
    @officer = assign(:officer, Officer.create!(
      position: "Position",
      email: "Email",
      companyID: 2,
      year_elected: "Year Elected",
      description: "Description",
      photo: "Photo",
      officer_id: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Position/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Year Elected/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/Photo/)
    expect(rendered).to match(/3/)
  end
end
