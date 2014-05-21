class Api::V1::TotalReportsController < ApplicationController
	def test_progress
		@total_report = TotalReport.find(params[:id])
		render json: @total_report.test_progress
	end

	def device_failure_detail
		@total_report = TotalReport.find(params[:id])
		render json: {device_failure_detail: @total_report.device_fail_results}
	end
end

# /api/v1/total_reports/1/device_failure_detail