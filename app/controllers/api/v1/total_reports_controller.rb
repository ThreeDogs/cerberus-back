class Api::V1::TotalReportsController < ApplicationController
	def test_progress
		@total_report = TotalReport.find(params[:id])
		render json: @total_report.test_progress
	end
end