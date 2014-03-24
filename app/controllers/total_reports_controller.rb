class TotalReportsController < ApplicationController
  before_action :set_total_report, only: [:show, :edit, :update, :destroy]

  # GET /total_reports
  # GET /total_reports.json
  def index
    @project = set_project
    @total_reports = TotalReport.all
  end

  # GET /total_reports/1
  # GET /total_reports/1.json
  def show
    @project = set_project
  end

  # GET /total_reports/new
  def new
    @total_report = TotalReport.new
  end

  # GET /total_reports/1/edit
  def edit
  end

  # POST /total_reports
  # POST /total_reports.json
  def create
    @total_report = TotalReport.new(total_report_params)

    respond_to do |format|
      if @total_report.save
        format.html { redirect_to @total_report, notice: 'Total report was successfully created.' }
        format.json { render action: 'show', status: :created, location: @total_report }
      else
        format.html { render action: 'new' }
        format.json { render json: @total_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /total_reports/1
  # PATCH/PUT /total_reports/1.json
  def update
    respond_to do |format|
      if @total_report.update(total_report_params)
        format.html { redirect_to @total_report, notice: 'Total report was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @total_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /total_reports/1
  # DELETE /total_reports/1.json
  def destroy
    @total_report.destroy
    respond_to do |format|
      format.html { redirect_to total_reports_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_total_report
      @total_report = TotalReport.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def total_report_params
      params.require(:total_report).permit(:apk, :test_datetime, :project_id, :deviceship_id)
    end

end
