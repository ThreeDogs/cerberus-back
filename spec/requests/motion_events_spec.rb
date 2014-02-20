require 'spec_helper'

describe "MotionEvents" do
  describe "GET /motion_events" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get motion_events_path
      response.status.should be(200)
    end
  end
end
