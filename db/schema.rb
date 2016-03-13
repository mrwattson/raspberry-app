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

ActiveRecord::Schema.define(version: 20160313234332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consumption_rates", force: :cascade do |t|
    t.integer  "min_contracted_power"
    t.integer  "max_contracted_power"
    t.integer  "min"
    t.integer  "max"
    t.float    "kwatt_cost"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "plan_id"
  end

  add_index "consumption_rates", ["plan_id"], name: "index_consumption_rates_on_plan_id", using: :btree

  create_table "plans", force: :cascade do |t|
    t.string   "name"
    t.integer  "min_contracted_power"
    t.integer  "max_contracted_power"
    t.float    "contracted_power_extra_cost"
    t.float    "fixed_monthly_cost"
    t.integer  "max_consumption_for_special_fixed_monthly_cost"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "readings", force: :cascade do |t|
    t.float    "raw"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "device_id"
    t.integer  "request_time"
    t.integer  "device_reading_created_at"
  end

  add_index "readings", ["device_id"], name: "index_readings_on_device_id", using: :btree

  create_table "time_ranges", force: :cascade do |t|
    t.string   "description"
    t.boolean  "summer_time"
    t.integer  "start_hour"
    t.integer  "end_hour"
    t.float    "kwatt_cost"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "plan_id"
  end

  add_index "time_ranges", ["plan_id"], name: "index_time_ranges_on_plan_id", using: :btree

end
