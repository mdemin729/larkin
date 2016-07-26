class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :client, index: true, foreign_key: true
      t.decimal :volume, precision: 7, scale: 2
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
