class DevicesController < ServiceController
	def index
		@total_report = TotalReport.find(params[:total_report_id])
		@project = @total_report.project
		@devices = @total_report.devices

		respond_to do |format|
    	format.html
    	format.csv {render text: @devices.to_csv}
    	format.xls
    end
	end
end