require "rails_helper"

RSpec.describe ContactFormsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/contact_forms").to route_to("contact_forms#index")
    end

    it "routes to #new" do
      expect(get: "/contact_forms/new").to route_to("contact_forms#new")
    end

    it "routes to #show" do
      expect(get: "/contact_forms/1").to route_to("contact_forms#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/contact_forms/1/edit").to route_to("contact_forms#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/contact_forms").to route_to("contact_forms#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/contact_forms/1").to route_to("contact_forms#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/contact_forms/1").to route_to("contact_forms#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/contact_forms/1").to route_to("contact_forms#destroy", id: "1")
    end
  end
end
