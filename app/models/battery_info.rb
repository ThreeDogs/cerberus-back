class BatteryInfo < ActiveRecord::Base
	default_scope { order('client_timestamp DESC') } 
	belongs_to :detail_report
end
