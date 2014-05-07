class CreateScenarioships < ActiveRecord::Migration
  def change
    create_table :scenarioships do |t|
      t.references :total_report, index: true
      t.references :test_scenario, index: true

      t.timestamps
    end
  end
end
