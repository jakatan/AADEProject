require 'rails_helper'

RSpec.describe "home_pages/index", type: :view do
  before(:each) do
    assign(:home_pages, [
      HomePage.create!(),
      HomePage.create!()
    ])
  end

  it "renders a list of home_pages" do
    render
  end
end
