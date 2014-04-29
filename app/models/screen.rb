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

class Screen < ActiveRecord::Base
	mount_uploader :url, ScreenshotUploader
	belongs_to :motion_event_info, foreign_key: 'client_timestamp', primary_key: 'client_timestamp'
end
