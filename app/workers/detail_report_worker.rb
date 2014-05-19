require "json"

class DetailReportWorker
	include Sidekiq::Worker
	sidekiq_options queue: :data, backtrace: true

	def perform(detail_report_json)
		detail_report = JSON.parse(detail_report_json)
		DetailReport.create!(detail_report)
	end
end