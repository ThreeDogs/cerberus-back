class Api::V1::MotionEventsController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	before_action :set_motion_event, only: [:show]
	respond_to :json

	def create
		@test_scenario = TestScenario.find(params[:test_scenario_id])
		@motion_events = @test_scenario.motion_events.build(JSON.parse(params[:motion_events]))

		MotionEvent.transaction do
			begin
				MotionEvent.import @motion_events
				render status: :created, json: {response: "success_created"}
			rescue Exception => e
				render status: :unprocessable_entity, json: {response: "error #{e}"}
				raise ActiveRecord::Rollback
			end
		end
	end

	private
		def set_motion_event
			@motion_event = MotionEvent.find(params[:id])
		end
end