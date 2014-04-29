class Screen < ActiveRecord::Base
	mount_uploader :url, ScreenshotUploader
	# belongs_to :device, foreign_key: 'device_key', primary_key: 'device_key'
	# has_many :detail_reports, foreign_key: 'device_key', primary_key: 'device_key'
end
