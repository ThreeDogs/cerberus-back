require 'spec_helper'

describe "motion_events/edit" do
  before(:each) do
    @motion_event = assign(:motion_event, stub_model(MotionEvent,
      :seq_id => 1,
      :sleep => 1,
      :activity_class => "MyString",
      :action_type => "MyString",
      :param => "MyString",
      :view => "MyString",
      :report_id => 1
    ))
  end

  it "renders the edit motion_event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", motion_event_path(@motion_event), "post" do
      assert_select "input#motion_event_seq_id[name=?]", "motion_event[seq_id]"
      assert_select "input#motion_event_sleep[name=?]", "motion_event[sleep]"
      assert_select "input#motion_event_activity_class[name=?]", "motion_event[activity_class]"
      assert_select "input#motion_event_action_type[name=?]", "motion_event[action_type]"
      assert_select "input#motion_event_param[name=?]", "motion_event[param]"
      assert_select "input#motion_event_view[name=?]", "motion_event[view]"
      assert_select "input#motion_event_report_id[name=?]", "motion_event[report_id]"
    end
  end
end
