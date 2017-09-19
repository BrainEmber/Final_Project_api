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

ActiveRecord::Schema.define(version: 20170919021728) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fusers", force: :cascade do |t|
    t.string "name"
    t.string "genera"
    t.string "game"
    t.string "hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ledgers", force: :cascade do |t|
    t.bigint "muser_id"
    t.bigint "fuser_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fuser_id"], name: "index_ledgers_on_fuser_id"
    t.index ["muser_id"], name: "index_ledgers_on_muser_id"
  end

  create_table "musers", force: :cascade do |t|
    t.string "name"
    t.string "genera"
    t.string "game"
    t.string "hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ledgers", "fusers"
  add_foreign_key "ledgers", "musers"
end
