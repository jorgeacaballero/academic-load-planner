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

ActiveRecord::Schema.define(version: 20160403215142) do

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses_students", id: false, force: :cascade do |t|
    t.integer "course_id"
    t.integer "student_id"
  end

  add_index "courses_students", ["course_id"], name: "index_courses_students_on_course_id"
  add_index "courses_students", ["student_id"], name: "index_courses_students_on_student_id"

  create_table "courses_teachers", id: false, force: :cascade do |t|
    t.integer "teacher_id"
    t.integer "course_id"
  end

  add_index "courses_teachers", ["course_id"], name: "index_courses_teachers_on_course_id"
  add_index "courses_teachers", ["teacher_id"], name: "index_courses_teachers_on_teacher_id"

  create_table "rooms", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedule_events", force: :cascade do |t|
    t.integer  "teacher_id"
    t.integer  "course_id"
    t.datetime "start_time"
    t.datetime "end_rime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "room_id"
    t.integer  "time_order"
  end

  add_index "schedule_events", ["course_id"], name: "index_schedule_events_on_course_id"
  add_index "schedule_events", ["room_id"], name: "index_schedule_events_on_room_id"
  add_index "schedule_events", ["teacher_id"], name: "index_schedule_events_on_teacher_id"

  create_table "schedule_events_students", id: false, force: :cascade do |t|
    t.integer "schedule_event_id"
    t.integer "student_id"
  end

  add_index "schedule_events_students", ["schedule_event_id"], name: "index_schedule_events_students_on_schedule_event_id"
  add_index "schedule_events_students", ["student_id"], name: "index_schedule_events_students_on_student_id"

  create_table "student_satisfactions", force: :cascade do |t|
    t.integer  "student_id"
    t.float    "sat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "student_satisfactions", ["student_id"], name: "index_student_satisfactions_on_student_id"

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "start_time"
    t.integer  "end_time"
  end

end
