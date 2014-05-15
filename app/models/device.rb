# == Schema Information
#
# Table name: devices
#
#  id              :integer          not null, primary key
#  brand           :string(255)
#  cpu             :string(255)
#  model           :string(255)
#  os_version      :string(255)
#  country         :string(255)
#  device_key      :string(255)
#  total_report_id :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class Device < ActiveRecord::Base
	belongs_to :project
	belongs_to :total_report
	# has_many :deviceships
  # has_many :total_report, through: :deviceships
  
  has_many :detail_reports, foreign_key: 'device_key', primary_key: 'device_key'
end
