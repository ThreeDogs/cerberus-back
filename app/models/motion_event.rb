# == Schema Information
#
# Table name: motion_events
#
#  id               :integer          not null, primary key
#  seq_id           :integer
#  time_stamp       :datetime
#  sleep            :integer
#  activity_class   :string(255)
#  action_type      :string(255)
#  param            :string(255)
#  view             :string(255)
#  test_scenario_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class MotionEvent < ActiveRecord::Base
	belongs_to :test_scenario

	validates :seq_id, presence: true
end
