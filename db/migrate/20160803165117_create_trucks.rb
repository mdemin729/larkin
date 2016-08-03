class CreateTrucks < ActiveRecord::Migration
  def change
    create_table :trucks do |t|
      t.string :model
      t.integer :max_weight
      t.integer :max_volume
      t.references :driver, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
