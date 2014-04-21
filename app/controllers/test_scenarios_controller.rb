class TestScenariosController < ApplicationController
  before_action :set_test_scenario, only: [:show, :edit, :update, :destroy]

  # GET /test_scenarios
  # GET /test_scenarios.json
  def index
    @project = set_project
    @test_scenarios = TestScenario.all
    # test_scenario.name
    # test_scenario.description
    # test_scenario.get_rank
    # test_scenario.recent_test_date
  end

  # GET /test_scenarios/1
  # GET /test_scenarios/1.json
  def show
    @project = set_project
    # @test_scenario.name
    # @test_scenario.description
    # @test_scenario.get_rank
    # @test_scenario.recent_test_date
  end

  # GET /test_scenarios/new
  def new
    @test_scenario = TestScenario.new
  end

  # GET /test_scenarios/1/edit
  def edit
  end

  # POST /test_scenarios
  # POST /test_scenarios.json
  def create
    @test_scenario = TestScenario.new(test_scenario_params)

    respond_to do |format|
      if @test_scenario.save
        format.html { redirect_to @test_scenario, notice: 'Test scenario was successfully created.' }
        format.json { render action: 'show', status: :created, location: @test_scenario }
      else
        format.html { render action: 'new' }
        format.json { render json: @test_scenario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_scenarios/1
  # PATCH/PUT /test_scenarios/1.json
  def update
    respond_to do |format|
      if @test_scenario.update(test_scenario_params)
        format.html { redirect_to @test_scenario, notice: 'Test scenario was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @test_scenario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_scenarios/1
  # DELETE /test_scenarios/1.json
  def destroy
    @test_scenario.destroy
    respond_to do |format|
      format.html { redirect_to test_scenarios_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_scenario
      @test_scenario = TestScenario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_scenario_params
      params.require(:test_scenario).permit(:name, :description, :rank, :project_id, :scenarioship_id)
    end
end
