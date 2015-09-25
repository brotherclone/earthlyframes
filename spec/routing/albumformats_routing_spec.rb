require "rails_helper"

RSpec.describe AlbumformatsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/albumformats").to route_to("albumformats#index")
    end

    it "routes to #new" do
      expect(:get => "/albumformats/new").to route_to("albumformats#new")
    end

    it "routes to #show" do
      expect(:get => "/albumformats/1").to route_to("albumformats#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/albumformats/1/edit").to route_to("albumformats#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/albumformats").to route_to("albumformats#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/albumformats/1").to route_to("albumformats#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/albumformats/1").to route_to("albumformats#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/albumformats/1").to route_to("albumformats#destroy", :id => "1")
    end

  end
end
