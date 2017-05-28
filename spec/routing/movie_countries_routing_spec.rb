require "rails_helper"

RSpec.describe MovieCountriesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/movie_countries").to route_to("movie_countries#index")
    end

    it "routes to #new" do
      expect(:get => "/movie_countries/new").to route_to("movie_countries#new")
    end

    it "routes to #show" do
      expect(:get => "/movie_countries/1").to route_to("movie_countries#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/movie_countries/1/edit").to route_to("movie_countries#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/movie_countries").to route_to("movie_countries#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/movie_countries/1").to route_to("movie_countries#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/movie_countries/1").to route_to("movie_countries#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/movie_countries/1").to route_to("movie_countries#destroy", :id => "1")
    end

  end
end
