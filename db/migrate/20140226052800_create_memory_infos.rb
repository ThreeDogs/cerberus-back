class CreateMemoryInfos < ActiveRecord::Migration
  def change
    create_table :memory_infos do |t|
      t.integer :dalvik_size
      t.integer :dalvik_alloc
      t.integer :native_size
      t.integer :native_alloc
      t.integer :motion_event_id
      t.integer :report_id

      t.timestamps
    end
  end
end
