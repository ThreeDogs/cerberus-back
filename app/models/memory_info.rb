# == Schema Information
#
# Table name: memory_infos
#
#  id              :integer          not null, primary key
#  dalvik_size     :integer
#  dalvik_alloc    :integer
#  native_size     :integer
#  native_alloc    :integer
#  motion_event_id :integer
#  report_id       :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class MemoryInfo < ActiveRecord::Base
	belongs_to :report
	belongs_to :motion_event

	validates :motion_event_id, presence: true
	validates :report_id, presence: true
end
