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
		@motion_event_infos = @detail_report.motion_event_infos
		render 'detail_reports/api/get_report_infos'
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