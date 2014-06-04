class Api::V1::ApksController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }

	def apk_conversion_status
		@apk = Apk.find(params[:id])
		render json: @apk.apk_conversion_done?
	end

	def create_device
		@device = Device.new(params[:device])
		if @device.save!
			render json: @device.id
		else
			render json: "Fail"
		end
	end

	def destroy_device
		@device = Device.find(params[:device_id])
		if @device.destroy!
			render json: "Delete"
		else
			render json: "Fail"
		end
	end
end