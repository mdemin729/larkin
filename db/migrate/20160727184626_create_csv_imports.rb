class CreateCsvImports < ActiveRecord::Migration
  def change
    create_table :csv_imports do |t|
      t.string :csv

      t.timestamps null: false
    end
  end
end
