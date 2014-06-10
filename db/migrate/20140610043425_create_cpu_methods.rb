class CreateCpuMethods < ActiveRecord::Migration
  def change
    create_table :cpu_methods do |t|
      t.integer :tree_key
      t.integer :parent_key
      t.string :class_name
      t.string :method_name
      t.integer :start_timestamp
      t.integer :end_timestamp
      t.references :detail_report, index: true

      t.timestamps
    end
  end
end
