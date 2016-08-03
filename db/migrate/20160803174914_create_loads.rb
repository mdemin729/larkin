class CreateLoads < ActiveRecord::Migration
  def change
    create_table :loads do |t|
      t.references :daily_schedule, index: true, foreign_key: true
      t.string :delivery_shift
      t.references :driver, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
