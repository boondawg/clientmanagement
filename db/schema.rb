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

ActiveRecord::Schema.define(version: 20140304045319) do

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
    t.datetime "start_date_time"
    t.integer  "client_id"
    t.integer  "practitioner_id"
    t.integer  "consultation_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "end_date_time"
  end

  add_index "consultations", ["client_id"], name: "index_consultations_on_client_id"
  add_index "consultations", ["consultation_type_id"], name: "index_consultations_on_consultation_type_id"
  add_index "consultations", ["practitioner_id"], name: "index_consultations_on_practitioner_id"

  create_table "note_fields", force: true do |t|
    t.integer  "note_id"
    t.integer  "note_template_field_id"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "note_fields", ["note_id"], name: "index_note_fields_on_note_id"
  add_index "note_fields", ["note_template_field_id"], name: "index_note_fields_on_note_template_field_id"

  create_table "note_template_fields", force: true do |t|
    t.integer  "note_template_id"
    t.integer  "order"
    t.string   "name"
    t.string   "type"
    t.string   "defaultValue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "note_template_fields", ["note_template_id"], name: "index_note_template_fields_on_note_template_id"

  create_table "note_templates", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "current"
  end

  create_table "notes", force: true do |t|
    t.integer  "consultation_id"
    t.integer  "client_id"
    t.integer  "note_template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["client_id"], name: "index_notes_on_client_id"
  add_index "notes", ["consultation_id"], name: "index_notes_on_consultation_id"
  add_index "notes", ["note_template_id"], name: "index_notes_on_note_template_id"

  create_table "practitioners", force: true do |t|
    t.string   "first_name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "last_name"
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
