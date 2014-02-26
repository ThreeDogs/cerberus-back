# == Schema Information
#
# Table name: motion_events
#
#  id             :integer          not null, primary key
#  seq_id         :integer
#  time_stamp     :datetime
#  sleep          :integer
#  activity_class :string(255)
#  action_type    :string(255)
#  param          :string(255)
#  view           :string(255)
#  report_id      :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class MotionEvent < ActiveRecord::Base
	belongs_to :report
	has_one :memory_info
	has_one :cpu_info

	validates :report_id, presence: true
	validates :seq_id, presence: true
end
