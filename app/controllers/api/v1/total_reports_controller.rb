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
		# Rank OS Version search
		@total_report = TotalReport.find(params[:id])
		@crashes = @total_report.crashes.search(params[:error_ranks],params[:os_versions])
		render 'total_reports/api/test_errors'
	end
end