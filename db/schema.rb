# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160803174914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone_number"
    t.string   "phone_ext"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "csv_imports", force: :cascade do |t|
    t.string   "csv",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "drivers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "loads", force: :cascade do |t|
    t.date     "delivery_date"
    t.string   "delivery_shift"
    t.integer  "driver_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "loads", ["driver_id"], name: "index_loads_on_driver_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.date     "delivery_date"
    t.string   "delivery_shift"
    t.string   "origin_name"
    t.string   "origin_raw_line_1"
    t.string   "origin_city"
    t.string   "origin_state"
    t.string   "origin_zip"
    t.string   "origin_country"
    t.string   "client_name"
    t.string   "destination_raw_line_1"
    t.string   "destination_city"
    t.string   "destination_state"
    t.string   "destination_zip"
    t.string   "destination_country"
    t.string   "phone_number"
    t.string   "phone_ext"
    t.string   "mode"
    t.string   "purchase_order_number"
    t.float    "volume"
    t.integer  "handling_unit_quantity"
    t.string   "handling_unit_type"
    t.integer  "raw_order_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "orders", ["raw_order_id"], name: "index_orders_on_raw_order_id", using: :btree

  create_table "raw_orders", force: :cascade do |t|
    t.integer  "row_num"
    t.string   "delivery_date"
    t.string   "delivery_shift"
    t.string   "origin_name"
    t.string   "origin_raw_line_1"
    t.string   "origin_city"
    t.string   "origin_state"
    t.string   "origin_zip"
    t.string   "origin_country"
    t.string   "client_name"
    t.string   "destination_raw_line_1"
    t.string   "destination_city"
    t.string   "destination_state"
    t.string   "destination_zip"
    t.string   "destination_country"
    t.string   "phone_number"
    t.string   "mode"
    t.string   "purchase_order_number"
    t.string   "volume"
    t.string   "handling_unit_quantity"
    t.string   "handling_unit_type"
    t.integer  "csv_import_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "order_id"
  end

  add_index "raw_orders", ["csv_import_id"], name: "index_raw_orders_on_csv_import_id", using: :btree
  add_index "raw_orders", ["order_id"], name: "index_raw_orders_on_order_id", using: :btree

  create_table "test_data", force: :cascade do |t|
    t.text    "delivery_date"
    t.text    "delivery_shift"
    t.text    "origin_name"
    t.text    "origin_raw_line_1"
    t.text    "origin_city"
    t.text    "origin_state"
    t.text    "origin_zip"
    t.text    "origin_country"
    t.text    "client_name"
    t.text    "destination_raw_line_1"
    t.text    "destination_city"
    t.text    "destination_state"
    t.text    "destination_zip"
    t.text    "destination_country"
    t.text    "phone_number"
    t.text    "mode"
    t.text    "purchase_order_number"
    t.decimal "volume",                 precision: 7, scale: 2
    t.integer "handling_unit_quantity"
    t.text    "handling_unit_type"
  end

  create_table "trucks", force: :cascade do |t|
    t.string   "model"
    t.integer  "max_weight"
    t.integer  "max_volume"
    t.integer  "driver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "trucks", ["driver_id"], name: "index_trucks_on_driver_id", using: :btree

  create_table "ttt", id: :bigserial, force: :cascade do |t|
    t.string "name", limit: 256, array: true
  end

  add_foreign_key "loads", "drivers"
  add_foreign_key "orders", "raw_orders"
  add_foreign_key "raw_orders", "csv_imports"
  add_foreign_key "trucks", "drivers"
end
