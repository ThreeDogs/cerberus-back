# == Schema Information
#
# Table name: battery_infos
#
#  id               :integer          not null, primary key
#  wifi             :integer
#  threeg           :integer
#  lcd              :integer
#  gps              :integer
#  sound            :integer
#  cpu              :integer
#  client_timestamp :integer
#  detail_report_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class BatteryInfo < ActiveRecord::Base
	default_scope { order('client_timestamp DESC') } 
	belongs_to :detail_report
end
