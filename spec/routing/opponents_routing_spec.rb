require "spec_helper"

describe OpponentsController do
  describe "routing" do

    it "routes to #index" do
      get("/opponents").should route_to("opponents#index")
    end

    it "routes to #new" do
      get("/opponents/new").should route_to("opponents#new")
    end

    it "routes to #show" do
      get("/opponents/1").should route_to("opponents#show", :id => "1")
    end

    it "routes to #edit" do
      get("/opponents/1/edit").should route_to("opponents#edit", :id => "1")
    end

    it "routes to #create" do
      post("/opponents").should route_to("opponents#create")
    end

    it "routes to #update" do
      put("/opponents/1").should route_to("opponents#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/opponents/1").should route_to("opponents#destroy", :id => "1")
    end

  end
end
