require 'spec_helper'

describe "reports/show" do
  before(:each) do
    @report = assign(:report, stub_model(Report,
      :package_name => "Package Name",
      :icon => "Icon",
      :app_version => "App Version",
      :os_version => "Os Version",
      :time_for_test => "9.99",
      :project_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Package Name/)
    rendered.should match(/Icon/)
    rendered.should match(/App Version/)
    rendered.should match(/Os Version/)
    rendered.should match(/9.99/)
    rendered.should match(/1/)
  end
end
