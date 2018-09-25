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

ActiveRecord::Schema.define(version: 2018_09_20_165359) do

  create_table "buddhists", force: :cascade do |t|
    t.string "status"
    t.string "name"
    t.string "email"
    t.integer "buzzer_id"
    t.string "telephone_number"
    t.boolean "program_sms"
    t.string "address"
    t.string "local_center"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "user_id"
    t.index ["user_id"], name: "index_buddhists_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "amount"
    t.datetime "month"
    t.string "currency"
    t.string "payment_type"
    t.string "payment_method"
    t.string "comment"
    t.boolean "library_member"
    t.boolean "bicycle_member"
    t.boolean "gym_member"
    t.boolean "parking_motorbike"
    t.boolean "parking_car"
    t.integer "buddhist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["buddhist_id"], name: "index_payments_on_buddhist_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "administrator"
    t.integer "buddhist_id"
    t.index ["buddhist_id"], name: "index_users_on_buddhist_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object"
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

end
