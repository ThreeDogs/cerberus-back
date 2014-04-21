class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.string :os_version
      t.string :model_name
      t.string :cpu_info
      t.integer :deviceship_id
      t.references :project, index: true

      t.timestamps
    end
  end
end
