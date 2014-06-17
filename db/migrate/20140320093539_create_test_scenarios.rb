class CreateTestScenarios < ActiveRecord::Migration
  def change
    create_table :test_scenarios do |t|
      t.string :name
      t.string :description
      t.string :export_code
      t.string :activity_name
      t.string :package_name
      t.integer :rank, default: 0
      t.references :project, index: true

      t.timestamps
    end
  end
end
