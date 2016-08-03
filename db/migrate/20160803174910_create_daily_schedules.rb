class CreateDailySchedules < ActiveRecord::Migration
  def change
    create_table :daily_schedules do |t|
      t.date :delivery_date

      t.timestamps null: false
    end
  end
end
