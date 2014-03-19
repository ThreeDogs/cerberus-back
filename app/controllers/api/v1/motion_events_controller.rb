class Api::V1::MotionEventsController < ApplicationController
	before_action :set_motion_event, only: [:show]
	respond_to :json

	# convention
	def show
		render 'motion_events/api/show'
	end

	private
		def set_motion_event
			@motion_event = MotionEvent.find(params[:id])
		end
end