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

ActiveRecord::Schema.define(version: 2018_10_28_014900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "acquired_certifications", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.integer "user_id"
    t.integer "certification_id"
    t.string "number"
    t.date "acquired_on"
    t.string "state"
    t.boolean "expires"
    t.date "expires_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["certification_id"], name: "index_acquired_certifications_on_certification_id"
    t.index ["user_id"], name: "index_acquired_certifications_on_user_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "agencies", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name"
    t.string "level"
    t.integer "location_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_agencies_on_email", unique: true
    t.index ["name"], name: "index_agencies_on_name", unique: true
  end

  create_table "ahoy_events", force: :cascade do |t|
    t.bigint "visit_id"
    t.bigint "user_id"
    t.string "name"
    t.jsonb "properties"
    t.datetime "time"
    t.index ["name", "time"], name: "index_ahoy_events_on_name_and_time"
    t.index ["properties"], name: "index_ahoy_events_on_properties_jsonb_path_ops", opclass: :jsonb_path_ops, using: :gin
    t.index ["user_id"], name: "index_ahoy_events_on_user_id"
    t.index ["visit_id"], name: "index_ahoy_events_on_visit_id"
  end

  create_table "ahoy_visits", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "visit_token"
    t.string "visitor_token"
    t.bigint "user_id"
    t.string "ip"
    t.text "user_agent"
    t.text "referrer"
    t.string "referring_domain"
    t.text "landing_page"
    t.string "browser"
    t.string "os"
    t.string "device_type"
    t.string "country"
    t.string "region"
    t.string "city"
    t.string "utm_source"
    t.string "utm_medium"
    t.string "utm_term"
    t.string "utm_content"
    t.string "utm_campaign"
    t.datetime "started_at"
    t.index ["user_id"], name: "index_ahoy_visits_on_user_id"
    t.index ["visit_token"], name: "index_ahoy_visits_on_visit_token", unique: true
  end

  create_table "badges_sashes", force: :cascade do |t|
    t.integer "badge_id"
    t.integer "sash_id"
    t.boolean "notified_user", default: false
    t.datetime "created_at"
    t.index ["badge_id", "sash_id"], name: "index_badges_sashes_on_badge_id_and_sash_id"
    t.index ["badge_id"], name: "index_badges_sashes_on_badge_id"
    t.index ["sash_id"], name: "index_badges_sashes_on_sash_id"
  end

  create_table "certifications", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "name"
    t.string "course_code"
    t.boolean "primary", default: false
    t.string "abbvr"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active"
    t.integer "creator_id"
    t.string "creator_type"
  end

  create_table "confirmations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.string "confirmable_id"
    t.string "confirmable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmable_id", "confirmable_type"], name: "index_confirmations_on_confirmable_id_and_confirmable_type"
    t.index ["confirmable_id", "user_id"], name: "index_confirmations_on_confirmable_id_and_user_id"
    t.index ["user_id"], name: "index_confirmations_on_user_id"
  end

  create_table "counties", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "county_subscriptions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.uuid "county_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["county_id"], name: "index_county_subscriptions_on_county_id"
    t.index ["user_id"], name: "index_county_subscriptions_on_user_id"
  end

  create_table "flags", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.string "flaggable_id"
    t.string "flaggable_type"
    t.string "reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flaggable_id", "flaggable_type"], name: "index_flags_on_flaggable_id_and_flaggable_type"
    t.index ["flaggable_id", "user_id"], name: "index_flags_on_flaggable_id_and_user_id"
    t.index ["user_id"], name: "index_flags_on_user_id"
  end

  create_table "hospital_statuses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "county"
    t.uuid "hospital_id"
    t.string "status"
    t.string "reason"
    t.datetime "start_time"
    t.datetime "expire_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hospital_id"], name: "index_hospital_statuses_on_hospital_id"
  end

  create_table "hospitals", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "location_id"
    t.string "abilities"
    t.string "county"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_hospitals_on_location_id"
  end

  create_table "incident_reports", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "message"
    t.uuid "user_id"
    t.uuid "incident_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["incident_id"], name: "index_incident_reports_on_incident_id"
    t.index ["user_id"], name: "index_incident_reports_on_user_id"
  end

  create_table "incident_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "incidents", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "message"
    t.uuid "location_id"
    t.uuid "incident_type_id"
    t.uuid "user_id"
    t.string "status"
    t.float "rank", default: 0.0
    t.boolean "archived", default: false
    t.datetime "ranked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "flagged", default: false
    t.uuid "county_id"
    t.index ["incident_type_id"], name: "index_incidents_on_incident_type_id"
    t.index ["location_id"], name: "index_incidents_on_location_id"
    t.index ["rank"], name: "index_incidents_on_rank"
    t.index ["user_id"], name: "index_incidents_on_user_id"
  end

  create_table "locations", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "uuid"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "state"
    t.string "county"
    t.string "city"
    t.string "box"
    t.string "zipcode"
    t.string "street"
    t.string "country", default: "US"
  end

  create_table "merit_actions", force: :cascade do |t|
    t.integer "user_id"
    t.string "action_method"
    t.integer "action_value"
    t.boolean "had_errors", default: false
    t.string "target_model"
    t.integer "target_id"
    t.text "target_data"
    t.boolean "processed", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "merit_activity_logs", force: :cascade do |t|
    t.integer "action_id"
    t.string "related_change_type"
    t.integer "related_change_id"
    t.string "description"
    t.datetime "created_at"
  end

  create_table "merit_score_points", force: :cascade do |t|
    t.bigint "score_id"
    t.integer "num_points", default: 0
    t.string "log"
    t.datetime "created_at"
    t.index ["score_id"], name: "index_merit_score_points_on_score_id"
  end

  create_table "merit_scores", force: :cascade do |t|
    t.bigint "sash_id"
    t.string "category", default: "default"
    t.index ["sash_id"], name: "index_merit_scores_on_sash_id"
  end

  create_table "sashes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.string "uuid"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.string "uid"
    t.string "provider"
    t.string "first_name"
    t.string "last_name"
    t.string "zipcode"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "super_user", default: false
    t.string "sash_id"
    t.integer "level", default: 0
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "votes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "user_id"
    t.string "voteable_id"
    t.string "voteable_type"
    t.integer "vote_value", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_votes_on_user_id"
    t.index ["voteable_id", "user_id"], name: "index_votes_on_voteable_id_and_user_id"
    t.index ["voteable_id", "vote_value"], name: "index_votes_on_voteable_id_and_vote_value"
  end

  create_table "work_histories", id: :uuid, default: -> { "uuid_generate_v4()" }, force: :cascade do |t|
    t.integer "user_id"
    t.integer "agency_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "status"
    t.string "title"
    t.boolean "current"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "county_subscriptions", "counties"
  add_foreign_key "county_subscriptions", "users"
  add_foreign_key "flags", "users"
  add_foreign_key "hospital_statuses", "hospitals"
  add_foreign_key "hospitals", "locations"
  add_foreign_key "incident_reports", "incidents"
  add_foreign_key "incident_reports", "users"
  add_foreign_key "incidents", "incident_types"
  add_foreign_key "incidents", "locations"
  add_foreign_key "incidents", "users"
  add_foreign_key "votes", "users"
end
