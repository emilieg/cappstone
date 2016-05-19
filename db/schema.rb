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

ActiveRecord::Schema.define(version: 20160516192801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "website"
    t.string   "linkedin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.string   "phone"
    t.string   "email"
    t.string   "linkedin"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "contacts", ["company_id"], name: "index_contacts_on_company_id", using: :btree

  create_table "event_types", force: :cascade do |t|
    t.string   "activity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "address"
    t.string   "event_timestamp"
    t.integer  "event_type_id"
    t.integer  "job_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "events", ["event_type_id"], name: "index_events_on_event_type_id", using: :btree
  add_index "events", ["job_id"], name: "index_events_on_job_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "position"
    t.string   "department"
    t.string   "address"
    t.string   "apply_date"
    t.string   "job_description_url"
    t.boolean  "relocation"
    t.decimal  "comp_value",          precision: 10, scale: 2
    t.string   "comp_type"
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "jobs", ["company_id"], name: "index_jobs_on_company_id", using: :btree
  add_index "jobs", ["user_id"], name: "index_jobs_on_user_id", using: :btree

  create_table "notes", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "notes", ["job_id"], name: "index_notes_on_job_id", using: :btree

  create_table "resumes", force: :cascade do |t|
    t.integer  "job_id"
    t.string   "name"
    t.string   "attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "provider_id"
    t.string   "provider_hash"
    t.string   "email"
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_foreign_key "contacts", "companies"
  add_foreign_key "events", "event_types"
  add_foreign_key "events", "jobs"
  add_foreign_key "jobs", "companies"
  add_foreign_key "jobs", "users"
  add_foreign_key "notes", "jobs"
end
