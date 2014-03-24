class ApksController < ApplicationController
	before_action :set_apk, only: [:show]
	# before_action :set_project, only: [:show, :create, :show]

	def new
		@apk = set_project.apks.new
	end

	def create
		if @apk = set_project.apks.create(apk_params)
			redirect_to [@project,@apk]
		else
			render 'new'
		end
	end

	def show
		@project = set_project
		@total_report = set_apk.total_reports.new
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_apk
      @apk = Apk.find(params[:id])
    end

    def set_project
   		@project = Project.find(params[:project_id]) 	
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apk_params
      params.require(:apk).permit(:apk)
    end
end