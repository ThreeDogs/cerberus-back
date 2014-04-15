# == Schema Information
#
# Table name: total_reports
#
#  id            :integer          not null, primary key
#  test_datetime :string(255)
#  app_version   :string(255)
#  status        :boolean          default(FALSE)
#  apk_id        :integer
#  project_id    :integer
#  deviceship_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'spec_helper'

describe TotalReport do
	# let(:user) {User.new(email: "foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")}
	# let(:project) {user.projects.new(name: "First App")}
	# let(:apk) {project.apks.new}
	subject(:total_report) {create(:total_report_true)}
	

	it{should respond_to(:project)}
	it{should respond_to(:apk)}
  it{should respond_to(:detail_reports)}
  it{should respond_to(:status)}
  it{should respond_to(:app_version)}

  # it "complete_total_reports scope test" do
  # 	TotalReport.all.size.should == 1
  # end
end


describe DetailReport do
  context "is validation check" do
		subject(:detail_report){DetailReport.new}
		it{should_not be_valid}
	end

	let(:user) {User.new(email: "foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")}
	let(:project) {user.projects.new(name: "First App")}
	let(:apk) {project.apks.new}
	let(:total_report) {apk.total_reports.new}
	subject(:detail_report){total_report.detail_reports.new(app_version: "1.0", test_datetime: "2013/03/03 3:00pm", status: 0)}

	it{should respond_to(:test_scenario)}
	it{should respond_to(:total_report)} 
end
