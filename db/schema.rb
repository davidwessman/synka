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

ActiveRecord::Schema.define(version: 2018_08_02_150810) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.bigint "service_id"
    t.integer "status", default: 0, null: false
    t.datetime "status_at"
    t.jsonb "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["service_id"], name: "index_authentications_on_service_id"
  end

  create_table "connections", force: :cascade do |t|
    t.uuid "location_id"
    t.bigint "service_id"
    t.string "remote_uid", default: "0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_connections_on_location_id"
    t.index ["service_id"], name: "index_connections_on_service_id"
  end

  create_table "locations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "kind", default: 0, null: false
    t.string "remote_uid"
    t.datetime "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "kind"], name: "index_services_on_user_id_and_kind", unique: true
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "shifts", force: :cascade do |t|
    t.bigint "connection_id"
    t.integer "day", default: 0, null: false
    t.time "from"
    t.time "to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["connection_id"], name: "index_shifts_on_connection_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "authentications", "services"
  add_foreign_key "connections", "locations"
  add_foreign_key "connections", "services"
  add_foreign_key "locations", "users"
  add_foreign_key "services", "users"
  add_foreign_key "shifts", "connections"
end
