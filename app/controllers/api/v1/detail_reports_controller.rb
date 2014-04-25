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
end

