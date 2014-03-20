# == Schema Information
#
# Table name: cpu_infos
#
#  id              :integer          not null, primary key
#  cpu_usage       :integer
#  motion_event_id :integer
#  report_id       :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class CpuInfo < ActiveRecord::Base
	# belongs_to :motion_event

	# validates :motion_event_id, presence: true
end
