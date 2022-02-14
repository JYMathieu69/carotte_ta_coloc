# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_01_31_202547) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "blazer_audits", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "query_id"
    t.text "statement"
    t.string "data_source"
    t.datetime "created_at"
    t.index ["query_id"], name: "index_blazer_audits_on_query_id"
    t.index ["user_id"], name: "index_blazer_audits_on_user_id"
  end

  create_table "blazer_checks", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "query_id"
    t.string "state"
    t.string "schedule"
    t.text "emails"
    t.text "slack_channels"
    t.string "check_type"
    t.text "message"
    t.datetime "last_run_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_blazer_checks_on_creator_id"
    t.index ["query_id"], name: "index_blazer_checks_on_query_id"
  end

  create_table "blazer_dashboard_queries", force: :cascade do |t|
    t.bigint "dashboard_id"
    t.bigint "query_id"
    t.integer "position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dashboard_id"], name: "index_blazer_dashboard_queries_on_dashboard_id"
    t.index ["query_id"], name: "index_blazer_dashboard_queries_on_query_id"
  end

  create_table "blazer_dashboards", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_blazer_dashboards_on_creator_id"
  end

  create_table "blazer_queries", force: :cascade do |t|
    t.bigint "creator_id"
    t.string "name"
    t.text "description"
    t.text "statement"
    t.string "data_source"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_blazer_queries_on_creator_id"
  end

  create_table "carotted_tasks", force: :cascade do |t|
    t.bigint "ongoing_task_id", null: false
    t.bigint "user_id", null: false
    t.bigint "carotted_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["carotted_user_id"], name: "index_carotted_tasks_on_carotted_user_id"
    t.index ["ongoing_task_id"], name: "index_carotted_tasks_on_ongoing_task_id"
    t.index ["user_id"], name: "index_carotted_tasks_on_user_id"
  end

  create_table "coloc_tasks", force: :cascade do |t|
    t.integer "difficulty"
    t.integer "points"
    t.bigint "coloc_id", null: false
    t.bigint "task_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coloc_id"], name: "index_coloc_tasks_on_coloc_id"
    t.index ["task_id"], name: "index_coloc_tasks_on_task_id"
  end

  create_table "colocs", force: :cascade do |t|
    t.string "name"
    t.string "invite_token"
    t.bigint "leader_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "assignment_day"
    t.integer "number_of_people"
    t.index ["leader_id"], name: "index_colocs_on_leader_id"
  end

  create_table "helpers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "ongoing_task_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ongoing_task_id"], name: "index_helpers_on_ongoing_task_id"
    t.index ["user_id"], name: "index_helpers_on_user_id"
  end

  create_table "ongoing_tasks", force: :cascade do |t|
    t.boolean "done", default: false
    t.datetime "finished_at"
    t.float "points_ratio", default: 1.0
    t.integer "final_points"
    t.bigint "coloc_task_id", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coloc_task_id"], name: "index_ongoing_tasks_on_coloc_task_id"
    t.index ["user_id"], name: "index_ongoing_tasks_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "recurrence"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "auto_assigned"
    t.integer "default_difficulty"
  end

  create_table "unfinished_tasks", force: :cascade do |t|
    t.bigint "ongoing_task_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ongoing_task_id"], name: "index_unfinished_tasks_on_ongoing_task_id"
    t.index ["user_id"], name: "index_unfinished_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.integer "current_points"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "coloc_id"
    t.boolean "admin", default: false
    t.index ["coloc_id"], name: "index_users_on_coloc_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.boolean "validated"
    t.bigint "ongoing_task_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ongoing_task_id"], name: "index_votes_on_ongoing_task_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "carotted_tasks", "ongoing_tasks"
  add_foreign_key "carotted_tasks", "users"
  add_foreign_key "carotted_tasks", "users", column: "carotted_user_id"
  add_foreign_key "coloc_tasks", "colocs"
  add_foreign_key "coloc_tasks", "tasks"
  add_foreign_key "colocs", "users", column: "leader_id"
  add_foreign_key "helpers", "ongoing_tasks"
  add_foreign_key "helpers", "users"
  add_foreign_key "ongoing_tasks", "coloc_tasks"
  add_foreign_key "ongoing_tasks", "users"
  add_foreign_key "unfinished_tasks", "ongoing_tasks"
  add_foreign_key "unfinished_tasks", "users"
  add_foreign_key "users", "colocs"
  add_foreign_key "votes", "ongoing_tasks"
  add_foreign_key "votes", "users"
end
