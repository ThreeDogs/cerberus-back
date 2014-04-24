class CreateTestScenarios < ActiveRecord::Migration
  def change
    create_table :test_scenarios do |t|
      t.string :name
      t.string :description
      t.integer :rank
      t.references :project, index: true
      t.integer :scenarioship_id

      t.timestamps
    end
  end
end
