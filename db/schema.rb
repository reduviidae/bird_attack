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

ActiveRecord::Schema.define(version: 2019_01_23_204741) do

  create_table "attacks", force: :cascade do |t|
    t.integer "child_id"
    t.integer "bird_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "damage_done"
  end

  create_table "birds", force: :cascade do |t|
    t.string "species"
    t.boolean "sickness"
    t.integer "attack"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "children", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.integer "hp"
    t.integer "hunger"
    t.boolean "sickness", default: false
    t.integer "location_x"
    t.integer "location_y"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
  end

  create_table "doctors", force: :cascade do |t|
    t.integer "location_x"
    t.integer "location_y"
    t.integer "hp_increase"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "foods", force: :cascade do |t|
    t.integer "location_x"
    t.integer "location_y"
    t.integer "hunger_decrease"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

end
