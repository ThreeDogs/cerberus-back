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
		@screen = Screen.new(screen_params)

		if @screen.save
			render status: :created, json: {response: "success_created", client_timestamp: @screen.client_timestamp, url: @screen.image}
		else
			render status: :unprocessable_entity, json: {response: "error #{e}"}
		end
	end

	def get_report_infos
		
	end

	private 

	def screen_params
		params.require(:screen).permit(:image, :client_timestamp)		
	end
end