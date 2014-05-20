class CreateCrashes < ActiveRecord::Migration
  def change
    create_table :crashes do |t|
      t.string :error_name, index: true
      t.string :error_line, index: true
      t.text :description
      t.references :total_report, index: true

      t.timestamps
    end
  end
end


