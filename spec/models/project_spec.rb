# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Project do
	context "is validation check" do
		subject(:project){Project.new}
		it{should_not be_valid}
	end

	let(:user) {User.new(email: "foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")}
  subject(:project) {user.projects.new(name: "First App")}

  it{should respond_to(:user)} # belongs_to user
  it{should respond_to(:apks)}
  it{should respond_to(:total_reports)}
  it{should respond_to(:test_scenarios)}
  it{should respond_to(:name)}
end

describe User do
	subject(:user) {User.new(email: "foobar@foobar.com", password: "foobarfoo", password_confirmation: "foobarfoo")}
	it{should respond_to(:email)}
	it{should respond_to(:password)}
	it{should respond_to(:projects)}
end
