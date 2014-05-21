class CreateTotalReports < ActiveRecord::Migration
  def change
    create_table :total_reports do |t|
      t.string :test_datetime
      t.boolean :status, default: false
      t.references :apk, index: true
      t.references :project, index: true
      t.integer :deviceship_id

      t.timestamps
    end
  end
end
