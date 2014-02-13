require 'spec_helper'

describe "reports/edit" do
  before(:each) do
    @report = assign(:report, stub_model(Report,
      :package_name => "MyString",
      :icon => "MyString",
      :app_version => "MyString",
      :os_version => "MyString",
      :time_for_test => "9.99",
      :project_id => 1
    ))
  end

  it "renders the edit report form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", report_path(@report), "post" do
      assert_select "input#report_package_name[name=?]", "report[package_name]"
      assert_select "input#report_icon[name=?]", "report[icon]"
      assert_select "input#report_app_version[name=?]", "report[app_version]"
      assert_select "input#report_os_version[name=?]", "report[os_version]"
      assert_select "input#report_time_for_test[name=?]", "report[time_for_test]"
      assert_select "input#report_project_id[name=?]", "report[project_id]"
    end
  end
end
