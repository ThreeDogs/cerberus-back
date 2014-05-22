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
		@detail_reports = @total_report.detail_reports
		render 'total_reports/api/detail_report_list'
	end

	def device_report_list
		@total_report = TotalReport.find(params[:id])
		@devices = @total_report.devices
		render 'total_reports/api/device_report_list'
	end

	def test_report_list
		
	end
end