class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :brand
      t.string :cpu_info
      t.string :model
      t.string :os_version
      t.string :country
      t.string :device_key
      t.references :total_report, index: true

      t.timestamps
    end
  end
end
