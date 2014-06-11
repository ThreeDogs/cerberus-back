class CreateFrameDrawTimes < ActiveRecord::Migration
  def change
    create_table :frame_draw_times do |t|
      t.string :view_type
      t.integer :load_start_timestamp
      t.integer :load_finish_timestamp
      t.string :view_id
      t.references :detail_report, index: true

      t.timestamps
    end
  end
end
