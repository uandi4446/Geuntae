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

ActiveRecord::Schema.define(version: 20151019092925) do

  create_table "avg_time_data", primary_key: "enum", force: :cascade do |t|
    t.time     "avg_start_time", null: false
    t.time     "avg_end_time",   null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "members", primary_key: "enum", force: :cascade do |t|
    t.string   "password_digest", limit: 255,   null: false
    t.string   "name",            limit: 255,   null: false
    t.string   "birth",           limit: 255,   null: false
    t.text     "position",        limit: 65535
    t.text     "department",      limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "remember_token",  limit: 255
    t.string   "image_path",      limit: 255
  end

  add_index "members", ["remember_token"], name: "index_members_on_remember_token", using: :btree

  create_table "time_data", force: :cascade do |t|
    t.string   "enum",       limit: 255, null: false
    t.date     "date",                   null: false
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "time_data", ["enum"], name: "fk_id", using: :btree

  add_foreign_key "avg_time_data", "members", column: "enum", primary_key: "enum", name: "fk_id_avg", on_delete: :cascade
  add_foreign_key "time_data", "members", column: "enum", primary_key: "enum", name: "fk_id", on_delete: :cascade
end
