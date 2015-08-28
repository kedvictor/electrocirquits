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

ActiveRecord::Schema.define(version: 20150828124746) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "balls", force: :cascade do |t|
    t.integer  "student_id",                             null: false
    t.integer  "examination_id",                         null: false
    t.decimal  "value",          precision: 6, scale: 1
    t.string   "note"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "examinations", force: :cascade do |t|
    t.string   "title"
    t.string   "short_title"
    t.string   "note"
    t.string   "mnemo"
    t.date     "date"
    t.integer  "group_id",                                            null: false
    t.integer  "max_value",                                           null: false
    t.decimal  "weight",      precision: 4, scale: 2, default: 1.0
    t.boolean  "active",                              default: false
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.integer  "priority",                            default: 0
  end

  create_table "groups", force: :cascade do |t|
    t.string   "title"
    t.integer  "year",                          null: false
    t.integer  "speciality_id",                 null: false
    t.boolean  "active",        default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "priority",      default: 0
  end

  create_table "pages", force: :cascade do |t|
    t.text     "html"
    t.string   "mnemo"
    t.boolean  "permanent",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", null: false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "specialities", force: :cascade do |t|
    t.string   "title"
    t.string   "short_title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: :cascade do |t|
    t.string   "full_name",                 null: false
    t.integer  "group_id",                  null: false
    t.string   "note"
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "variables", force: :cascade do |t|
    t.string   "key"
    t.string   "value"
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
