# == Schema Information
#
# Table name: screens
#
#  id               :integer          not null, primary key
#  url              :string(255)
#  client_timestamp :integer
#  created_at       :datetime
#  updated_at       :datetime
#

require 'spec_helper'

describe Screen do
	it "screen motion_event_info associations test" do
		@motion_event_info = MotionEventInfo.create!(activity_class: "MainActivity", client_timestamp: 1234)
		@s = Screen.create!(client_timestamp: 1234)
		@s.motion_event_info.activity_class.should == "MainActivity"
	end
end
