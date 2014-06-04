class TotalReportsController < ServiceController
  def start_test
    @total_report = TotalReport.find(params[:id])
    @total_report.start_test unless @total_report.status
    redirect_to total_report_detail_reports_path(@total_report)
  end

  def index
    @project = set_project
    @total_reports = TotalReport.all
  end

  def tests
    @total_report = TotalReport.find(params[:id])
    @project = @total_report.project
  end

  def show
    @project = set_project
    @total_report = TotalReport.find(params[:id])
    @crashes = @total_report.crashes
    
    redirect_to total_report_detail_reports_path(@total_report) unless @total_report.status
  end

  def create
    @apk = Apk.find(params[:apk_id])
    @project = Project.find(@apk.project.id)
    @total_report = @apk.total_reports.build(project_id: @project.id)
    session[:return_to] ||= request.referer

    test_scenario_ids = params[:total_report][:test_scenario_ids].collect{|key,value| key.to_i if value == "1"}.compact

    TotalReport.transaction do
      begin
        raise "test scenario choice" if test_scenario_ids.length < 1
        @total_report.save!
        test_scenario_ids.each do |test_scenario_id|
          @total_report.scenarioships.create!(test_scenario_id: test_scenario_id)
        end
        redirect_to start_test_total_report_path(@total_report)
      rescue Exception => e
        redirect_to session.delete(:return_to)
      raise ActiveRecord::Rollback
      end 
    end
  end

  def destroy
    @total_report.destroy
    respond_to do |format|
      format.html { redirect_to total_reports_url }
      format.json { head :no_content }
    end
  end
end
