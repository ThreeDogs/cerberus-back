class Api::V1::DetailReportsController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json

	def create
		@detail_report = DetailReport.new(JSON.parse(params[:detail_report]))

		if @detail_report.save
			render status: :created, json: {response: "success_created"}
		else
			render status: :unprocessable_entity, json: {response: "error #{e}"}
		end
	end

	def upload_screenshot
		@screen = Screen.new(image: params[:image], client_timestamp: params[:client_timestamp])

		if @screen.save
			render status: :created, json: {response: "success_created", client_timestamp: @screen.client_timestamp, url: @screen.image}
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

	private 

	# def screen_params
		# params.require(:screen).permit(:image, :client_timestamp)		
	# end
end