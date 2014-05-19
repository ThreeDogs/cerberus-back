class Api::V1::ApksController < ApplicationController
	def apk_conversion_status
		@apk = Apk.find(params[:id])
		render json: @apk.apk_conversion_done?
	end
end