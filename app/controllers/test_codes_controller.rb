class TestCodesController < ServiceController
  before_action :set_test_code, only: [:show, :edit, :update, :destroy]

  # GET /test_codes
  # GET /test_codes.json
  def index
    @project = set_project
    @test_codes = @project.test_codes
  end

  # GET /test_codes/new
  def new
    @project = set_project
    @test_code = @project.test_codes.build
  end

  # POST /test_codes
  # POST /test_codes.json
  def create
    @project = set_project
    @test_code = @project.test_codes.build(test_code_params)

    if @test_code.save!
      redirect_to project_test_codes_path(@project), notice: 'Test code was successfully created.'
    else 
      render action: 'new'
    end
  end

  # DELETE /test_codes/1
  # DELETE /test_codes/1.json
  def destroy
    @test_code.destroy
    redirect_to project_test_codes_path(set_project)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_code
      @test_code = TestCode.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_code_params
      params.require(:test_code).permit(:import_code_java, :import_code_class, :project_id)
    end
end
