class Api::V1::TestScenariosController < ApplicationController
	skip_before_filter :verify_authenticity_token, :if => Proc.new { |c| c.request.format == 'application/json' }
	respond_to :json

	def create
		@project = Project.find(params[:project_id])
		@test_scenario = @project.test_scenarios.build

		if @test_scenario.save
			render status: :created, json: {response: "test_scenario_id: #{@test_scenario.id}"}
		else
			render status: :unprocessable_entity, json: {response: "error"}
		end
	end

	def motion_event_list
		@test_scenario = TestScenario.find(params[:id])
		@motion_events = @test_scenario.motion_events
		render json: {motion_event_infos: @motion_events}
	end
end
