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

ActiveRecord::Schema.define(version: 20140223074443) do

  create_table "clients", force: true do |t|
    t.string   "first_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "weight"
    t.date     "date_of_birth"
    t.string   "gender"
    t.text     "address"
    t.string   "last_name"
  end

  create_table "consultation_types", force: true do |t|
    t.string   "name"
    t.decimal  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consultations", force: true do |t|
    t.datetime "date"
    t.integer  "client_id"
    t.integer  "practitioners_id"
    t.integer  "consultation_types_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "consultations", ["client_id"], name: "index_consultations_on_client_id"
  add_index "consultations", ["consultation_types_id"], name: "index_consultations_on_consultation_types_id"
  add_index "consultations", ["practitioners_id"], name: "index_consultations_on_practitioners_id"

  create_table "practitioners", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", force: true do |t|
    t.string   "transaction_type"
    t.decimal  "amount"
    t.integer  "consultation_id"
    t.datetime "date"
    t.string   "payment_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transactions", ["consultation_id"], name: "index_transactions_on_consultation_id"

end
