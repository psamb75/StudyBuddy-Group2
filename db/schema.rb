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

ActiveRecord::Schema.define(version: 2019_12_01_214649) do

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "attendees", force: :cascade do |t|
    t.string "event_name"
    t.string "user_name"
    t.bigint "user_id", null: false
    t.bigint "study_group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["study_group_id"], name: "index_attendees_on_study_group_id"
    t.index ["user_id"], name: "index_attendees_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "text"
    t.integer "parent"
    t.bigint "user_id", null: false
    t.bigint "note_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "ancestry", default: 0
    t.integer "ind", default: 0
    t.index ["note_id"], name: "index_comments_on_note_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_code"
    t.string "course_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_courses_on_user_id"
  end

  create_table "enrolments", force: :cascade do |t|
    t.string "user_name"
    t.string "course_name"
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["course_id"], name: "index_enrolments_on_course_id"
    t.index ["user_id"], name: "index_enrolments_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.string "course_code"
    t.string "title"
    t.string "tag"
    t.string "user_name"
    t.string "timeline"
    t.string "location"
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["course_id"], name: "index_notes_on_course_id"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "recipient_id"
    t.integer "actor_id"
    t.datetime "read_at"
    t.string "action"
    t.integer "notifiable_id"
    t.string "notifiable_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "study_groups", force: :cascade do |t|
    t.string "event_name"
    t.string "user_name"
    t.string "location"
    t.string "description"
    t.string "course_code"
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.datetime "date"
    t.index ["course_id"], name: "index_study_groups_on_course_id"
    t.index ["user_id"], name: "index_study_groups_on_user_id"
  end

  create_table "tutoring_sessions", force: :cascade do |t|
    t.string "tutor_name"
    t.string "student_name"
    t.string "course_code"
    t.bigint "user_id", null: false
    t.bigint "tutor_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rating"
    t.boolean "completed", default: false
    t.index ["tutor_id"], name: "index_tutoring_sessions_on_tutor_id"
    t.index ["user_id"], name: "index_tutoring_sessions_on_user_id"
  end

  create_table "tutors", force: :cascade do |t|
    t.string "user_name"
    t.string "course_code"
    t.text "description"
    t.float "rate"
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "date"
    t.integer "hours"
    t.boolean "completed", default: false
    t.index ["course_id"], name: "index_tutors_on_course_id"
    t.index ["user_id"], name: "index_tutors_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "password"
    t.text "description"
    t.string "first_name"
    t.string "last_name"
    t.string "phone_num"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "card_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "attendees", "study_groups"
  add_foreign_key "attendees", "users"
  add_foreign_key "comments", "notes"
  add_foreign_key "comments", "users"
  add_foreign_key "courses", "users"
  add_foreign_key "enrolments", "courses"
  add_foreign_key "enrolments", "users"
  add_foreign_key "notes", "courses"
  add_foreign_key "notes", "users"
  add_foreign_key "study_groups", "courses"
  add_foreign_key "study_groups", "users"
  add_foreign_key "tutoring_sessions", "tutors"
  add_foreign_key "tutoring_sessions", "users"
  add_foreign_key "tutors", "courses"
  add_foreign_key "tutors", "users"
end
