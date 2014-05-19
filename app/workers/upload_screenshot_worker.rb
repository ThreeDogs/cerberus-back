class	UploadScreenshotWorker
	include Sidekiq::Worker

	def perform(screen)
		screen.save!
	end
end