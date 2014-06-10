class CrashesController < ServiceController
	def show
		@total_report = TotalReport.find(params[:total_report_id])
		@project = @total_report.project
		@crash = Crash.find(params[:id])
		@detail_reports = @crash.detail_reports
	end

	def index
		@total_report = TotalReport.find(params[:total_report_id])
		@project = @total_report.project
		@crashes = @total_report.crashes

		respond_to do |format|
    	format.html
    	format.csv {render text: @crashes.to_csv}
    	format.xls
    end
	end
end