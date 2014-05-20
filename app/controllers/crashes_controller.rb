class MotionEventsController < ApplicationController
	def show
		@project = set_project
		@total_report = TotalReport.find(params[:total_report_id])
		@crash = Crash.find(params[:id])
	end
end