class ServiceController < ApplicationController
  layout "service"
  before_action :authenticate_user!
  respond_to :html, :json
  
  protected

  	def set_project
   		@project = Project.find(params[:project_id]) 	
  	end

  	def set_project_id(id)
   		@project = Project.find(id) 	
  	end
end
