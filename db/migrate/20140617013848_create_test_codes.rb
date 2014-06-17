class CreateTestCodes < ActiveRecord::Migration
  def change
    create_table :test_codes do |t|
      t.string :import_code_java
      t.string :import_code_class
      t.references :project, index: true

      t.timestamps
    end
  end
end
