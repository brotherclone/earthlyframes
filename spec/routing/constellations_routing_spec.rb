require "rails_helper"

RSpec.describe ConstellationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/constellations").to route_to("constellations#index")
    end

    it "routes to #new" do
      expect(get: "/constellations/new").to route_to("constellations#new")
    end

    it "routes to #show" do
      expect(get: "/constellations/1").to route_to("constellations#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/constellations/1/edit").to route_to("constellations#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/constellations").to route_to("constellations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/constellations/1").to route_to("constellations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/constellations/1").to route_to("constellations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/constellations/1").to route_to("constellations#destroy", id: "1")
    end
  end
end
