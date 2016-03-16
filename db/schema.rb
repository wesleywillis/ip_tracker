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

ActiveRecord::Schema.define(version: 20160316231601) do

  create_table "care_pairs", force: :cascade do |t|
    t.integer  "client_id"
    t.integer  "worker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "primary_phone",       limit: 8
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.float    "max_monthly_minutes",           default: 9600.0
    t.boolean  "alert_admin"
  end

  create_table "districts", force: :cascade do |t|
    t.string   "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "sms"
  end

  create_table "phones", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "number"
  end

  create_table "shifts", force: :cascade do |t|
    t.integer  "care_pair_id"
    t.string   "start_gps"
    t.boolean  "start_range"
    t.string   "stop_time"
    t.string   "stop_gps"
    t.boolean  "stop_range"
    t.boolean  "final_range"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "gps_id"
    t.float    "shift_minutes"
    t.boolean  "alert_admin",   default: false
  end

  create_table "workers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "primary_phone",      limit: 8
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "max_weekly_minutes",           default: 2400.0
  end

end
