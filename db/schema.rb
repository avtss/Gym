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

ActiveRecord::Schema[8.0].define(version: 2025_01_23_005708) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "email"
    t.string "phone"
    t.string "membership_type"
    t.date "membership_start_date"
    t.date "membership_end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "middle_name"
  end

  create_table "trainers", force: :cascade do |t|
    t.string "specialization"
    t.string "email"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
  end

  create_table "trainings", force: :cascade do |t|
    t.integer "trainer_id", null: false
    t.integer "client_id", null: false
    t.integer "duration_minutes"
    t.string "training_type"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "training_date", null: false
    t.time "training_time", null: false
    t.index ["client_id"], name: "index_trainings_on_client_id"
    t.index ["trainer_id"], name: "index_trainings_on_trainer_id"
  end

  create_table "work_schedules", force: :cascade do |t|
    t.bigint "trainer_id", null: false
    t.string "day_of_week"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trainer_id"], name: "index_work_schedules_on_trainer_id"
  end

  add_foreign_key "trainings", "clients"
  add_foreign_key "trainings", "trainers"
  add_foreign_key "work_schedules", "trainers"
end
