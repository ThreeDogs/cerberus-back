class CreateCodeships < ActiveRecord::Migration
  def change
    create_table :codeships do |t|
      t.references :test_code, index: true
      t.references :total_report, index: true

      t.timestamps
    end
  end
end
