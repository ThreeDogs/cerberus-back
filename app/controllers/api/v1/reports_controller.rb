class Api::V1::ReportsController < ApplicationController
	before_action :set_detail_report, only: [:get_memory_reports, :get_cpu_reports, :get_motion_reports]

	respond_to :json

	def get_memory_reports
		@memory_reports = @reports.memory_reports	
		render 'detail_reports/api/get_memory_reports'
	end

	def get_cpu_reports
		@cpu_reports = @reports.cpu_reports
		render 'detail_reports/api/get_cpu_reports'
	end

	def get_motion_reports
		@motion_reports = @reports.motion_reports
		render 'detail_reports/api/get_motion_reports'
	end

	private

		def set_detail_report
			@detail_report_id = params[:id].to_i	
			@reports = Report.get_report_by_id(@detail_report_id)
		end
end