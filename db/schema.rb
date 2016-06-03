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

ActiveRecord::Schema.define(version: 20160601021542) do

  create_table "carriers", force: :cascade do |t|
    t.string   "name"
    t.string   "email_address", null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "carriers", ["name"], name: "index_carriers_on_name"

  create_table "sessions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "session_key",       null: false
    t.string   "auth_code",         null: false
    t.datetime "last_auth_attempt", null: false
    t.datetime "last_active",       null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "sessions", ["auth_code"], name: "index_sessions_on_auth_code"
  add_index "sessions", ["session_key"], name: "index_sessions_on_session_key"
  add_index "sessions", ["user_id"], name: "index_sessions_on_user_id"

  create_table "users", force: :cascade do |t|
    t.integer  "carrier_id"
    t.string   "phone",      null: false
    t.string   "nickname",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["carrier_id"], name: "index_users_on_carrier_id"
  add_index "users", ["nickname"], name: "index_users_on_nickname"

  create_table "vaporwaves", force: :cascade do |t|
    t.integer  "user_id"
    t.binary   "image",      null: false
    t.integer  "score",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "vaporwaves", ["user_id"], name: "index_vaporwaves_on_user_id"

  create_table "votes", force: :cascade do |t|
    t.integer  "vaporwave_id"
    t.integer  "user_id"
    t.boolean  "vote",         null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "votes", ["user_id"], name: "index_votes_on_user_id"
  add_index "votes", ["vaporwave_id"], name: "index_votes_on_vaporwave_id"

end
