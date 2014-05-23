class Api::V1::TotalReportsController < ApplicationController
	respond_to :json

	def test_progress
		@total_report = TotalReport.find(params[:id])
		render json: @total_report.test_progress
	end

	def device_failure_detail
		@total_report = TotalReport.find(params[:id])
		render json: {device_failure_detail: @total_report.device_fail_results}
	end

	def test_rank_rate
		@total_report = TotalReport.find(params[:id])
		render json: @total_report.test_rank_rate
	end

	def test_errors
		@total_report = TotalReport.find(params[:id])
		@crashes = @total_report.crashes.search(params[:error_ranks],params[:os_versions])
		render 'total_reports/api/test_errors'
	end

	def detail_report_list
		@total_report = TotalReport.find(params[:id])
		@search = @total_report.detail_reports.search(status_in: params[:status], device_os_version_in: params[:os_version], device_model_cont: params[:model], test_scenario_rank_in: params[:rank], test_scenario_name_cont: params[:scenario_name])
		@detail_reports = @search.result.includes(:device, :test_scenario).uniq!
		render 'total_reports/api/detail_report_list'
	end

	def device_report_list
		@total_report = TotalReport.find(params[:id])
		@search = @total_report.devices.search(os_version_in: params[:os_version], model_cont: params[:model])
		@devices = @search.result.uniq!
		render 'total_reports/api/device_report_list'
	end

	def test_report_list
		@total_report = TotalReport.find(params[:id])
		@search = @total_report.test_scenarios.search(rank_in: params[:rank], name_cont: params[:name], detail_reports_status_in: params[:status])
		@test_scenarios = @search.result.includes(:detail_reports).uniq!
		render 'total_reports/api/test_report_list'
	end
end