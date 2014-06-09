class CreateNetworkInfos < ActiveRecord::Migration
  def change
    create_table :network_infos do |t|
      t.integer :response_size
      t.integer :request_size
      t.integer :client_timestamp
      t.integer :detail_report_id

      t.timestamps
    end
  end
end
