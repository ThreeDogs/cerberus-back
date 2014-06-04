class DevicesController < ServiceController
	def index
		@total_report = TotalReport.find(params[:total_report_id])
		@project = @total_report.project
	end
end