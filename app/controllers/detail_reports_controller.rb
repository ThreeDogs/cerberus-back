class DetailReportsController < ApplicationController
  before_action :set_detail_report, only: [:show, :edit, :update, :destroy]

  # GET /detail_reports
  # GET /detail_reports.json
  def index
    @detail_reports = DetailReport.all
  end

  # GET /detail_reports/1
  # GET /detail_reports/1.json
  def show
    @project = set_project_id(set_detail_report.project_id)
  end

  # GET /detail_reports/new
  def new
    @detail_report = DetailReport.new
  end

  # GET /detail_reports/1/edit
  def edit
  end

  # POST /detail_reports
  # POST /detail_reports.json
  def create
    @detail_report = DetailReport.new(detail_report_params)

    respond_to do |format|
      if @detail_report.save
        format.html { redirect_to @detail_report, notice: 'Detail report was successfully created.' }
        format.json { render action: 'show', status: :created, location: @detail_report }
      else
        format.html { render action: 'new' }
        format.json { render json: @detail_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /detail_reports/1
  # PATCH/PUT /detail_reports/1.json
  def update
    respond_to do |format|
      if @detail_report.update(detail_report_params)
        format.html { redirect_to @detail_report, notice: 'Detail report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @detail_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /detail_reports/1
  # DELETE /detail_reports/1.json
  def destroy
    @detail_report.destroy
    respond_to do |format|
      format.html { redirect_to detail_reports_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_detail_report
      @detail_report = DetailReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def detail_report_params
      params.require(:detail_report).permit(:app_version, :test_datetime, :status, :running_time, :test_scenario_id, :device_id, :total_report_id)
    end
end
