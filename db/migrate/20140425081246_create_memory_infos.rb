class CreateMemoryInfos < ActiveRecord::Migration
  def change
    create_table :memory_infos do |t|
      t.integer :mem_total
      t.integer :dalvik_heap_alloc
      t.integer :native_heap_size
      t.integer :dalvik_heap_size
      t.integer :native_heap_alloc
      t.integer :mem_alloc
      t.string :client_timestamp
      t.references :detail_report, index: true

      t.timestamps
    end
  end
end
