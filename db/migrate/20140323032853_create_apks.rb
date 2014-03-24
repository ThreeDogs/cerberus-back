class CreateApks < ActiveRecord::Migration
  def change
    create_table :apks do |t|
      t.string :apk
      t.string :test_apk
      t.references :project, index: true

      t.timestamps
    end
  end
end
