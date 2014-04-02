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

ActiveRecord::Schema.define(version: 20140402144116) do

  create_table "buddhists", force: true do |t|
    t.string   "status"
    t.string   "name"
    t.string   "email"
    t.integer  "buzzer_id"
    t.string   "telephone_number"
    t.boolean  "program_sms"
    t.string   "address"
    t.string   "local_center"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.decimal  "amount"
    t.datetime "month"
    t.string   "currency"
    t.string   "payment_type"
    t.string   "payment_method"
    t.string   "comment"
    t.boolean  "library_member"
    t.boolean  "bicycle_member"
    t.boolean  "gym_member"
    t.boolean  "parking_motorbike"
    t.boolean  "parking_car"
    t.integer  "buddhist_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "payments", ["buddhist_id"], name: "index_payments_on_buddhist_id"

end
