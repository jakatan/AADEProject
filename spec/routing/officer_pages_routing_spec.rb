require "rails_helper"

RSpec.describe OfficerPagesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/officer_pages").to route_to("officer_pages#index")
    end

    it "routes to #new" do
      expect(get: "/officer_pages/new").to route_to("officer_pages#new")
    end

    it "routes to #show" do
      expect(get: "/officer_pages/1").to route_to("officer_pages#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/officer_pages/1/edit").to route_to("officer_pages#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/officer_pages").to route_to("officer_pages#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/officer_pages/1").to route_to("officer_pages#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/officer_pages/1").to route_to("officer_pages#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/officer_pages/1").to route_to("officer_pages#destroy", id: "1")
    end
  end
end
