require 'spec_helper'

describe "motion_events/index" do
  before(:each) do
    assign(:motion_events, [
      stub_model(MotionEvent,
        :seq_id => 1,
        :sleep => 2,
        :activity_class => "Activity Class",
        :action_type => "Action Type",
        :param => "Param",
        :view => "View",
        :report_id => 3
      ),
      stub_model(MotionEvent,
        :seq_id => 1,
        :sleep => 2,
        :activity_class => "Activity Class",
        :action_type => "Action Type",
        :param => "Param",
        :view => "View",
        :report_id => 3
      )
    ])
  end

  it "renders a list of motion_events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Activity Class".to_s, :count => 2
    assert_select "tr>td", :text => "Action Type".to_s, :count => 2
    assert_select "tr>td", :text => "Param".to_s, :count => 2
    assert_select "tr>td", :text => "View".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
