class CreateMotionEventInfos < ActiveRecord::Migration
  def change
    create_table :motion_event_infos do |t|
      t.string :activity_class
      t.string :param
      t.string :view
      t.string :action_type
      t.integer :sleep
      t.integer :client_timestamp, index: true
      t.references :detail_report, index: true

      t.timestamps
    end
  end
end
