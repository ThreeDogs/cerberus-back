# == Schema Information
#
# Table name: screens
#
#  id               :integer          not null, primary key
#  image            :string(255)
#  client_timestamp :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Screen < ActiveRecord::Base
	mount_uploader :image, ScreenshotUploader
	belongs_to :motion_event_info, foreign_key: 'client_timestamp', primary_key: 'client_timestamp'
end
