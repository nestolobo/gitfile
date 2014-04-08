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

ActiveRecord::Schema.define(version: 20140405150256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: true do |t|
    t.string   "name"
    t.integer  "day"
    t.integer  "start_time"
    t.integer  "end_time"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["location_id"], name: "index_activities_on_location_id", using: :btree

  create_table "friends", force: true do |t|
    t.integer  "user_id"
    t.integer  "seq"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "friends", ["user_id"], name: "index_friends_on_user_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "name"
    t.integer  "deck"
    t.integer  "x"
    t.integer  "y"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "room_types", force: true do |t|
    t.string   "name"
    t.string   "capacity"
    t.string   "descrip"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "num"
    t.integer  "interest_level"
    t.integer  "room_type_id"
    t.integer  "room_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "occupancy"
    t.boolean  "is_user_updated"
  end

  add_index "users", ["room_id"], name: "index_users_on_room_id", using: :btree
  add_index "users", ["room_type_id"], name: "index_users_on_room_type_id", using: :btree

end
