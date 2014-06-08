class CreateBatteryInfos < ActiveRecord::Migration
  def change
    create_table :battery_infos do |t|
      t.integer :wifi
      t.integer :threeg
      t.integer :lcd
      t.integer :gps
      t.integer :sound
      t.integer :cpu
      t.integer :client_timestamp
      t.integer :detail_report_id

      t.timestamps
    end
  end
end
