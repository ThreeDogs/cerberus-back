class DetailReportWorker
	include Sidekiq::Worker
	sidekiq_options queue: :data, backtrace: true

	def perform(detail_report_json)
		detail_report = DetailReport.new(detail_report_json)
		detail_report.save!
	end
end