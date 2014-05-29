class DetailReportsController < ServiceController
  def index
    @total_report = TotalReport.find(params[:total_report_id])
    @project = @total_report.project
    @detail_reports = @total_report.detail_reports
  end

  def show
    @detail_report = DetailReport.find(params[:id])
    @project = set_project_id(@detail_report.project_id)
  end
end
