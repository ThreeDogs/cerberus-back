class DetailReportsController < ServiceController
  def index
    @total_report = TotalReport.find(params[:total_report_id])
    @project = @total_report.project
    @detail_reports = @total_report.detail_reports

    respond_to do |format|
    	format.html
    	format.csv {render text: @detail_reports.to_csv}
    	format.xls
    end
  end

  def show
    @detail_report = DetailReport.find(params[:id])
    @project = set_project_id(@detail_report.project_id)
  end
end
