class CreateCsvImports < ActiveRecord::Migration
  def change
    create_table :csv_imports do |t|
      t.text :csv

      t.timestamps null: false
    end
  end
end
