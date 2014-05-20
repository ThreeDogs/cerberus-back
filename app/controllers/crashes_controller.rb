class CrashesController < ApplicationController
	def show
		@total_report = TotalReport.find(params[:total_report_id])
		@project = @total_report.project
		@crash = Crash.find(params[:id])
		@detail_reports = @crash.detail_reports
	end
end