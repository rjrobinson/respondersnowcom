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

ActiveRecord::Schema.define(version: 20161207023345) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_agencies_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_agencies_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_agencies_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_agencies_on_unlock_token", unique: true, using: :btree
  end

  create_table "aquired_certifications", force: :cascade do |t|
    t.integer  "responder_id"
    t.integer  "certification_id"
    t.string   "number"
    t.date     "aquired_on"
    t.boolean  "expires"
    t.date     "expires_on"
    t.boolean  "primary"
    t.boolean  "legit",                 default: false
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.index ["certification_id"], name: "index_aquired_certifications_on_certification_id", using: :btree
    t.index ["responder_id"], name: "index_aquired_certifications_on_responder_id", using: :btree
  end

  create_table "certifications", force: :cascade do |t|
    t.string   "name"
    t.integer  "default_ceus"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "responder_profiles", force: :cascade do |t|
    t.integer  "responder_id"
    t.integer  "zipcode"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "responders", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.index ["confirmation_token"], name: "index_responders_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_responders_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_responders_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_responders_on_unlock_token", unique: true, using: :btree
  end

  create_table "work_histories", force: :cascade do |t|
    t.integer  "responder_id"
    t.integer  "agency_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "status"
    t.string   "title"
    t.boolean  "current"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
