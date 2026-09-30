require "rails_helper"

RSpec.describe ConstellationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/constellations").to route_to("constellations#index")
    end

    it "routes to #show" do
      expect(get: "/constellations/1").to route_to("constellations#show", id: "1")
    end
  end
end
