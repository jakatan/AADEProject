require 'rails_helper'

RSpec.describe "officer_pages/index", type: :view do
  before(:each) do
    assign(:officer_pages, [
      OfficerPage.create!(),
      OfficerPage.create!()
    ])
  end

  it "renders a list of officer_pages" do
    render
  end
end
