class CreateTotalReports < ActiveRecord::Migration
  def change
    create_table :total_reports do |t|
      t.string :apk
      t.string :test_apk
      t.string :test_datetime
      t.references :project, index: true
      t.integer :deviceship_id

      t.timestamps
    end
  end
end
