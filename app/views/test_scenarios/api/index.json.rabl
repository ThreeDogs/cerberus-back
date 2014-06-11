collection @test_scenarios
attributes :get_rank, :name, :description, :recent_test_date
node(:link){|t| project_test_scenario_path(@project.id, t)}