class ImportCodeGenerateWorker
	include Sidekiq::Worker
	sidekiq_options queue: :apk, backtrace: true, retry: false

	def perform(id)
		test_code = TestCode.find(id)
		test_code.import_code_generate
	end
end