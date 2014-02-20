require 'spec_helper'

describe "motion_events/show" do
  before(:each) do
    @motion_event = assign(:motion_event, stub_model(MotionEvent,
      :seq_id => 1,
      :sleep => 2,
      :activity_class => "Activity Class",
      :action_type => "Action Type",
      :param => "Param",
      :view => "View",
      :report_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Activity Class/)
    rendered.should match(/Action Type/)
    rendered.should match(/Param/)
    rendered.should match(/View/)
    rendered.should match(/3/)
  end
end
