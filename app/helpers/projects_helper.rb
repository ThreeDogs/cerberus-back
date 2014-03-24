module ProjectsHelper
	def current_project
		session[:current_project]
	end
end
