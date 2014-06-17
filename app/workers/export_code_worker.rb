require "json"

class ExportCodeWorker
	include Sidekiq::Worker
	sidekiq_options queue: :apk, backtrace: true, retry: false

	def perform(id)
		test_scenario = TestScenario.find(id)
		test_scenario.export_code_generate
	end
end