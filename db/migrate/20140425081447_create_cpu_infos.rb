class CreateCpuInfos < ActiveRecord::Migration
  def change
    create_table :cpu_infos do |t|
      t.integer :usage
      t.string :client_timestamp
      t.references :detail_report, index: true

      t.timestamps
    end
  end
end
