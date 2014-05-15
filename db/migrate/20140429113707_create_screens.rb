class CreateScreens < ActiveRecord::Migration
  def change
    create_table :screens do |t|
      t.string :image
      t.integer :client_timestamp, index: true

      t.timestamps
    end
  end
end
