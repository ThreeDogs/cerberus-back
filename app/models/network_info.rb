# == Schema Information
#
# Table name: network_infos
#
#  id               :integer          not null, primary key
#  response_size    :integer
#  request_size     :integer
#  client_timestamp :integer
#  detail_report_id :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class NetworkInfo < ActiveRecord::Base
	default_scope { order('client_timestamp DESC') } 
	belongs_to :detail_report
end
