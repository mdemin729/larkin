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
