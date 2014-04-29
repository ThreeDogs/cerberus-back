class CreateScreens < ActiveRecord::Migration
  def change
    create_table :screens do |t|
      t.string :image
      t.integer :client_timestamp

      t.timestamps
    end
  end
end
