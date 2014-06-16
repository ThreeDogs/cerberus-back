class ImportCodeGenerateWorker
	include Sidekiq::Worker
	sidekiq_options queue: :apk, backtrace: true, retry: false

	def perform(id)
		test_scenario = TestScenario.find(id)
		test_scenario.import_code_generate
	end
end