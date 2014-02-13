class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :package_name
      t.string :icon
      t.string :app_version
      t.string :os_version
      t.string :device_name
      t.string :country
      t.decimal :time_for_test
      t.integer :project_id

      t.timestamps
    end
  end
end
