require "rails_helper"

RSpec.describe OfficersController, type: :routing do
  describe "routing" do
    before do #Skip authentication for routing
      allow_any_instance_of(Devise::Controllers::Helpers).to receive(:authenticate_admin!).and_return(true)
    end
    it "routes to #index" do
      expect(get: "/officers").to route_to("officers#index")
    end

    it "routes to #new" do
      expect(get: "/officers/new").to route_to("officers#new")
    end

    it "routes to #show" do
      expect(get: "/officers/1").to route_to("officers#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/officers/1/edit").to route_to("officers#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/officers").to route_to("officers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/officers/1").to route_to("officers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/officers/1").to route_to("officers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/officers/1").to route_to("officers#destroy", id: "1")
    end
  end
end
