class CreateDetailReports < ActiveRecord::Migration
  def change
    create_table :detail_reports do |t|
      t.string :app_version
      t.integer :status
      t.float :running_time
      t.string :device_key, index: true
      t.references :test_scenario, index: true
      t.references :total_report, index: true
      t.references :crash, index: true

      t.timestamps
    end
  end
end
