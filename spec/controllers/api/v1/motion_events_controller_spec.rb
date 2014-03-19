require 'spec_helper'
require 'json'


describe Api::V1::MotionEventsController do
	render_views

	describe "GET #show" do
		it "assigns the requested project to @project" do
			motion_event = create(:motion_event)
			get :show, id: motion_event, format: "json"
			assigns(:motion_event).should eq(motion_event)
		end
	end
end

# 		it "renders the :show rabl json" do
# 			get :show, id: create(:motion_event)
# 			response.should render_template "motion_events/api/show.json.rabl"
# 		end

# 		it "motion_event connect d3 json" do
# 			get :show, id: create(:motion_event), format: :json
# 			response.should be_success

# 			body = JSON.parse(response.body)

# 			body.should be_a(Array)
# 		end
# 	end
# end


# Data Format
# [
# 	{
# 		"order": 0,
# 		"time": 0,
# 		"activity_name": "activity0",
# 		"event_type": "onClick",
# 		"event_name": "blah0"
# 	},
# 	{
# 		"order": 1,
# 		"time": 1,
# 		"activity_name": "activity1",
# 		"event_type": "onClick",
# 		"event_name": "blahblah1"
# 	}
# ]

#   it "should fail when code is not present" do
#   	get 'some_endpoint', :format => :json
#   	response.should be_success
 
#   	# Parse json response
#   	body = JSON.parse(response.body)
 
#   	# Test the json structure
#   	body.should include('status')
#   	status = body['status']
#   	status.should include('code')
#   	status.should include('message')
#   	status.should include('endpoint')
 
#   	# Test the response values
#   	status['code'].should eq(600)
#   	status['message'].should eq('Code is required')
#   end
# end