# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_06_004709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "reviews", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.bigint "barber_id", null: false
    t.string "title"
    t.string "comment"
    t.datetime "date"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["barber_id"], name: "index_reviews_on_barber_id"
    t.index ["client_id"], name: "index_reviews_on_client_id"
  end

  create_table "services", force: :cascade do |t|
    t.bigint "barber_id", null: false
    t.string "service_type"
    t.integer "price"
    t.integer "duration"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["barber_id"], name: "index_services_on_barber_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "reviews", "users", column: "barber_id"
  add_foreign_key "reviews", "users", column: "client_id"
  add_foreign_key "services", "users", column: "barber_id"
end
