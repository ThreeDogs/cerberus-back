require "json"

class DetailReportWithCrashWorker
	include Sidekiq::Worker
	sidekiq_options queue: :data, backtrace: true

	def perform(crash_json, detail_report_json)
		crash = JSON.parse(crash_json)
		detail_report = JSON.parse(detail_report_json)

		if c = TotalReport.find(crash["total_report_id"]).crashes.find_by_error_name_and_error_line(crash["error_name"], crash["error_line"])
			detail_report["crash_id"] = c["id"]
			puts "1"
		else
			c = Crash.create!(crash)
			detail_report["crash_id"] = c["id"]
			puts "2"
		end
		DetailReport.create!(detail_report)
	end
end