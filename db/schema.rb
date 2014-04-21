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

ActiveRecord::Schema.define(version: 20140323032853) do

  create_table "apks", force: true do |t|
    t.string   "apk"
    t.string   "test_apk"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "apks", ["project_id"], name: "index_apks_on_project_id"

  create_table "cpu_infos", force: true do |t|
    t.integer  "cpu_usage"
    t.integer  "motion_event_id"
    t.integer  "report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "detail_reports", force: true do |t|
    t.string   "app_version"
    t.string   "test_datetime"
    t.integer  "status"
    t.integer  "running_time"
    t.integer  "test_scenario_id"
    t.integer  "device_id"
    t.integer  "total_report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "detail_reports", ["test_scenario_id"], name: "index_detail_reports_on_test_scenario_id"
  add_index "detail_reports", ["total_report_id"], name: "index_detail_reports_on_total_report_id"

  create_table "memory_infos", force: true do |t|
    t.integer  "dalvik_size"
    t.integer  "dalvik_alloc"
    t.integer  "native_size"
    t.integer  "native_alloc"
    t.integer  "motion_event_id"
    t.integer  "report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "motion_events", force: true do |t|
    t.integer  "seq_id"
    t.datetime "time_stamp"
    t.integer  "sleep"
    t.string   "activity_class"
    t.string   "action_type"
    t.string   "param"
    t.string   "view"
    t.integer  "test_scenario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "icon"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_scenarios", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "rank"
    t.integer  "project_id"
    t.integer  "scenarioship_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_scenarios", ["project_id"], name: "index_test_scenarios_on_project_id"

  create_table "total_reports", force: true do |t|
    t.string   "test_datetime"
    t.string   "app_version"
    t.boolean  "status",        default: false
    t.integer  "apk_id"
    t.integer  "project_id"
    t.integer  "deviceship_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "total_reports", ["apk_id"], name: "index_total_reports_on_apk_id"
  add_index "total_reports", ["project_id"], name: "index_total_reports_on_project_id"

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
