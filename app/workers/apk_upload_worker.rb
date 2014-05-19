class ApkUploadWorker
	include Sidekiq::Worker
	sidekiq_options queue: :apk, backtrace: true

	def perform(apk_id)
		apk = Apk.find(apk_id)
		apk.update_apk_attributes
		apk.generate_test_apk
	end
end