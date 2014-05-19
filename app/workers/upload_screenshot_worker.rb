class	UploadScreenshotWorker
	include Sidekiq::Worker
	sidekiq_options queue: :image, backtrace: true

	def perform(image, client_timestamp)
		Screen.create!(image: image, client_timestamp: client_timestamp)
	end
end