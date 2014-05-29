class DetailReportsController < ServiceController
  def start_test
    @total_report = TotalReport.find(params[:total_report_id])
    @total_report.start_test unless @total_report.status
    redirect_to total_report_detail_reports_path(@total_report)
  end

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
