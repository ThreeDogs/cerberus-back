require "spec_helper"

describe MotionEventsController do
  describe "routing" do

    it "routes to #index" do
      get("/motion_events").should route_to("motion_events#index")
    end

    it "routes to #new" do
      get("/motion_events/new").should route_to("motion_events#new")
    end

    it "routes to #show" do
      get("/motion_events/1").should route_to("motion_events#show", :id => "1")
    end

    it "routes to #edit" do
      get("/motion_events/1/edit").should route_to("motion_events#edit", :id => "1")
    end

    it "routes to #create" do
      post("/motion_events").should route_to("motion_events#create")
    end

    it "routes to #update" do
      put("/motion_events/1").should route_to("motion_events#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/motion_events/1").should route_to("motion_events#destroy", :id => "1")
    end

  end
end
