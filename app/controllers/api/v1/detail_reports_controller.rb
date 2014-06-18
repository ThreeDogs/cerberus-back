class Api::V1::DetailReportsController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json

	def create
		if params[:crash]
			crash_json = params[:crash]
			detail_report_json = params[:detail_report]
			DetailReportWithCrashWorker.perform_async(crash_json, detail_report_json)
			render status: :created, json: crash_json
		else 
			detail_report_json = params[:detail_report]
			DetailReportWorker.perform_async(detail_report_json)
			render status: :created, json: {response: "success_created"}	
		end
	end

	def upload_screenshot
		if Screen.create!(image: params[:image], client_timestamp: params[:client_timestamp])
			render status: :created, json: "image updated"
		else
			render status: :unprocessable_entity, json: {response: "error #{e}"}
		end
	end

	def get_report_infos
		@detail_report = DetailReport.find(params[:id])
		@memory_infos = @detail_report.memory_infos
		@cpu_infos = @detail_report.cpu_infos
		@network_infos = @detail_report.network_infos
		@battery_infos = @detail_report.battery_infos
		@frame_draw_times = @detail_report.frame_draw_times
		@motion_event_infos = @detail_report.motion_event_infos
		render 'detail_reports/api/get_report_infos'
	end

	def get_motion_event_infos
		@detail_report = DetailReport.find(params[:id])
		@motion_event_infos = @detail_report.motion_event_infos
		render 'detail_reports/api/get_motion_event_infos'
	end

	def get_memory_infos
		@detail_report = DetailReport.find(params[:id])
		@memory_infos = @detail_report.memory_infos
		render 'detail_reports/api/get_memory_infos'
	end

	def get_cpu_infos
		@detail_report = DetailReport.find(params[:id])
		@cpu_infos = @detail_report.cpu_infos
		@cpu_methods = @detail_report.cpu_methods
		render 'detail_reports/api/get_cpu_infos'
	end

	def get_network_infos
		@detail_report = DetailReport.find(params[:id])
		@network_infos = @detail_report.network_infos
		render 'detail_reports/api/get_network_infos'
	end

	def get_battery_infos
		@detail_report = DetailReport.find(params[:id])
		@battery_infos = @detail_report.battery_infos
		render 'detail_reports/api/get_battery_infos'
	end

	def get_frame_draw_times
		@detail_report = DetailReport.find(params[:id])
		@frame_draw_times = @detail_report.frame_draw_times
		render 'detail_reports/api/get_frame_draw_times'
	end

	def finish_test
		@total_report = TotalReport.find(params[:total_report_id])
		if @total_report.update_attributes!(status: true)
			render status: :created, json: {response: "success_finish", status: @total_report.status}
		else
			render status: :unprocessable_entity, json: {response: "error #{e}"}
		end
	end
end