class CreateCpuInfos < ActiveRecord::Migration
  def change
    create_table :cpu_infos do |t|
      t.integer :cpu_usage
      t.integer :motion_event_id
      t.integer :report_id

      t.timestamps
    end
  end
end
