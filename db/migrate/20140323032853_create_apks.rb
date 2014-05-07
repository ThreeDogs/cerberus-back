class CreateApks < ActiveRecord::Migration
  def change
    create_table :apks do |t|
      t.string :apk
      t.string :test_apk
      t.string :package_name
      t.string :activity_name
      t.string :min_sdk
      t.references :project, index: true

      t.timestamps
    end
  end
end
