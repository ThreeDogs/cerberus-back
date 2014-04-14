class Api::V1::TestScenariosController < ApplicationController
	respond_to :json

	def create
		@project = Project.find(params[:id])
		@test_scenario = @project.test_scenarios.build
		@motion_events = @test_scenario.motion_events.build(JSON.parse(params[:motion_events]))

		TestScenario.transaction do
			begin
				@test_scenario.save
				MotionEvent.import @motion_events
				render status: :created, json: {response: "success_created"}
			rescue Exception => e
				render status: :unprocessable_entity, json: {response: "error #{e}"}
				raise ActiveRecord::Rollback
			end
		end
	end
end

