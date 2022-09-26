require "rails_helper"

RSpec.describe HomePagesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/home_pages").to route_to("home_pages#index")
    end

    it "routes to #new" do
      expect(get: "/home_pages/new").to route_to("home_pages#new")
    end

    it "routes to #show" do
      expect(get: "/home_pages/1").to route_to("home_pages#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/home_pages/1/edit").to route_to("home_pages#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/home_pages").to route_to("home_pages#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/home_pages/1").to route_to("home_pages#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/home_pages/1").to route_to("home_pages#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/home_pages/1").to route_to("home_pages#destroy", id: "1")
    end
  end
end
