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

ActiveRecord::Schema.define(version: 2019_05_27_114347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "cities", id: :serial, force: :cascade do |t|
    t.string "name", limit: 25
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "compartments", id: :serial, force: :cascade do |t|
    t.string "name", limit: 25
    t.integer "capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "compartments_trains", id: false, force: :cascade do |t|
    t.integer "compartment_id"
    t.integer "train_id"
    t.index ["compartment_id", "train_id"], name: "index_compartments_trains_on_compartment_id_and_train_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "routes", id: :serial, force: :cascade do |t|
    t.integer "source_id"
    t.integer "dest_id"
    t.integer "fare"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", id: :serial, force: :cascade do |t|
    t.integer "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "travel_id"
    t.integer "user_id"
    t.datetime "start_time"
    t.datetime "end_time"
  end

  create_table "trains", id: :serial, force: :cascade do |t|
    t.string "name", limit: 25
    t.integer "t_capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "avatar"
  end

  create_table "travels", id: :serial, force: :cascade do |t|
    t.integer "total_seats"
    t.integer "ava_seats"
    t.integer "train_id"
    t.integer "route_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "messages", "users"
end
