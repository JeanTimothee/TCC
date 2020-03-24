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

ActiveRecord::Schema.define(version: 2020_03_23_213422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.datetime "start_time"
    t.datetime "end_time"
    t.bigint "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_availabilities_on_student_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.integer "court"
    t.integer "capacity"
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean "mini_tennis", default: false
    t.bigint "teacher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teacher_id"], name: "index_lessons_on_teacher_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payments", force: :cascade do |t|
    t.integer "amount"
    t.string "type"
    t.date "time"
    t.string "period"
    t.text "comment"
    t.bigint "total_payment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["total_payment_id"], name: "index_payments_on_total_payment_id"
  end

  create_table "preference_students", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_preference_students_on_student_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "student_id", null: false
    t.bigint "preference_student_id", null: false
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["preference_student_id"], name: "index_preferences_on_preference_student_id"
    t.index ["student_id"], name: "index_preferences_on_student_id"
    t.index ["teacher_id"], name: "index_preferences_on_teacher_id"
  end

  create_table "referents", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "mobile_phone"
    t.string "fixed_phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "student_lessons", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "lesson_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lesson_id"], name: "index_student_lessons_on_lesson_id"
    t.index ["student_id"], name: "index_student_lessons_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "mobile_phone"
    t.string "fixed_phone"
    t.string "email"
    t.integer "nb_classes", default: 1
    t.datetime "birth_date"
    t.bigint "total_payment_id", null: false
    t.bigint "level_id", null: false
    t.bigint "referent_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["level_id"], name: "index_students_on_level_id"
    t.index ["referent_id"], name: "index_students_on_referent_id"
    t.index ["total_payment_id"], name: "index_students_on_total_payment_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "nickname"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "total_payments", force: :cascade do |t|
    t.integer "due"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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

  add_foreign_key "availabilities", "students"
  add_foreign_key "lessons", "teachers"
  add_foreign_key "payments", "total_payments"
  add_foreign_key "preference_students", "students"
  add_foreign_key "preferences", "preference_students"
  add_foreign_key "preferences", "students"
  add_foreign_key "preferences", "teachers"
  add_foreign_key "student_lessons", "lessons"
  add_foreign_key "student_lessons", "students"
  add_foreign_key "students", "levels"
  add_foreign_key "students", "referents"
  add_foreign_key "students", "total_payments"
end
