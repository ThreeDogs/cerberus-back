require 'spec_helper'

describe "reports/index" do
  before(:each) do
    assign(:reports, [
      stub_model(Report,
        :package_name => "Package Name",
        :icon => "Icon",
        :app_version => "App Version",
        :os_version => "Os Version",
        :time_for_test => "9.99",
        :project_id => 1
      ),
      stub_model(Report,
        :package_name => "Package Name",
        :icon => "Icon",
        :app_version => "App Version",
        :os_version => "Os Version",
        :time_for_test => "9.99",
        :project_id => 1
      )
    ])
  end

  it "renders a list of reports" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Package Name".to_s, :count => 2
    assert_select "tr>td", :text => "Icon".to_s, :count => 2
    assert_select "tr>td", :text => "App Version".to_s, :count => 2
    assert_select "tr>td", :text => "Os Version".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
