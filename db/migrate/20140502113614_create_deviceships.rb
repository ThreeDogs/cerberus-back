class CreateDeviceships < ActiveRecord::Migration
  def change
    create_table :deviceships do |t|
      t.references :total_report, index: true
      t.references :device, index: true

      t.timestamps
    end
  end
end
