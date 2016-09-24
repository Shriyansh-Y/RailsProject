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

ActiveRecord::Schema.define(version: 20160924173508) do

  create_table "bookings", force: :cascade do |t|
    t.integer  "room_id"
    t.integer  "member_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "booking_start_year"
    t.integer  "booking_start_month"
    t.integer  "booking_start_day"
    t.integer  "booking_start_hour"
  end

  create_table "members", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
    t.boolean  "admin"
  end

  create_table "rooms", force: :cascade do |t|
    t.string   "room_number"
    t.integer  "capacity"
    t.integer  "building"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
