# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

driver1 = Driver.create(:name => 'John Smith')
driver2 = Driver.create(:name => 'Bill Jackson')

Truck.create(:model => 'Mercedes Benz', :max_weight => 10000, :max_volume => 1400, :driver => driver1)
Truck.create(:model => 'Mercedes Benz', :max_weight => 10000, :max_volume => 1400, :driver => driver2)

ds1 = DailySchedule.create(:delivery_date => '2016-08-02')
Load.create(:daily_schedule => ds1, :delivery_shift => 'M', :driver => driver2)
Load.create(:daily_schedule => ds1, :delivery_shift => 'N', :driver => driver1)
Load.create(:daily_schedule => ds1, :delivery_shift => 'E', :driver => driver2)

ds2 = DailySchedule.create(:delivery_date => '2016-08-03')
Load.create(:daily_schedule => ds2, :delivery_shift => 'M', :driver => driver1)
Load.create(:daily_schedule => ds2, :delivery_shift => 'N', :driver => driver2)
Load.create(:daily_schedule => ds2, :delivery_shift => 'E', :driver => driver1)
