require "rails_helper"

RSpec.describe AlbumtypesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/albumtypes").to route_to("albumtypes#index")
    end

    it "routes to #new" do
      expect(:get => "/albumtypes/new").to route_to("albumtypes#new")
    end

    it "routes to #show" do
      expect(:get => "/albumtypes/1").to route_to("albumtypes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/albumtypes/1/edit").to route_to("albumtypes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/albumtypes").to route_to("albumtypes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/albumtypes/1").to route_to("albumtypes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/albumtypes/1").to route_to("albumtypes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/albumtypes/1").to route_to("albumtypes#destroy", :id => "1")
    end

  end
end
