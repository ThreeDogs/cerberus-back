json.array!(@test_scenarios) do |test_scenario|
  json.extract! test_scenario, :id, :name, :description, :rank, :project_id, :scenarioship_id
  json.url test_scenario_url(test_scenario, format: :json)
end
