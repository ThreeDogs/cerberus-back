class CreateTestScenarios < ActiveRecord::Migration
  def change
    create_table :test_scenarios do |t|
      t.string :name
      t.string :description
      t.string :export_code
      t.string :import_code_java
      t.string :import_code_class
      t.string :activity_name
      t.string :package_name
      t.boolean :file_type
      t.integer :rank, default: 0
      t.references :project, index: true
      t.integer :scenarioship_id

      t.timestamps
    end
  end
end
