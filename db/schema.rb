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

ActiveRecord::Schema.define(version: 20140610043535) do

  create_table "apks", force: true do |t|
    t.string   "apk"
    t.string   "test_apk"
    t.string   "test_bed_apk"
    t.string   "package_name"
    t.string   "activity_name"
    t.string   "min_sdk"
    t.string   "target_sdk"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "apks", ["project_id"], name: "index_apks_on_project_id", using: :btree

  create_table "battery_infos", force: true do |t|
    t.integer  "wifi"
    t.integer  "threeg"
    t.integer  "lcd"
    t.integer  "gps"
    t.integer  "sound"
    t.integer  "cpu"
    t.integer  "client_timestamp"
    t.integer  "detail_report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cpu_infos", force: true do |t|
    t.integer  "usage"
    t.integer  "client_timestamp"
    t.integer  "detail_report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cpu_infos", ["detail_report_id"], name: "index_cpu_infos_on_detail_report_id", using: :btree

  create_table "cpu_methods", force: true do |t|
    t.integer  "tree_key"
    t.integer  "parent_key"
    t.string   "class_name"
    t.string   "method_name"
    t.integer  "start_timestamp"
    t.integer  "end_timestamp"
    t.integer  "detail_report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cpu_methods", ["detail_report_id"], name: "index_cpu_methods_on_detail_report_id", using: :btree

  create_table "crashes", force: true do |t|
    t.string   "error_name"
    t.string   "error_line"
    t.text     "description"
    t.integer  "total_report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "crashes", ["total_report_id"], name: "index_crashes_on_total_report_id", using: :btree

  create_table "detail_reports", force: true do |t|
    t.string   "app_version"
    t.integer  "status"
    t.float    "running_time"
    t.string   "device_key"
    t.integer  "test_scenario_id"
    t.integer  "total_report_id"
    t.integer  "crash_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "detail_reports", ["crash_id"], name: "index_detail_reports_on_crash_id", using: :btree
  add_index "detail_reports", ["test_scenario_id"], name: "index_detail_reports_on_test_scenario_id", using: :btree
  add_index "detail_reports", ["total_report_id"], name: "index_detail_reports_on_total_report_id", using: :btree

  create_table "devices", force: true do |t|
    t.string   "brand"
    t.string   "cpu"
    t.string   "model"
    t.string   "os_version"
    t.string   "country"
    t.string   "device_key"
    t.integer  "total_report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "devices", ["total_report_id"], name: "index_devices_on_total_report_id", using: :btree

  create_table "deviceships", force: true do |t|
    t.integer  "total_report_id"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deviceships", ["device_id"], name: "index_deviceships_on_device_id", using: :btree
  add_index "deviceships", ["total_report_id"], name: "index_deviceships_on_total_report_id", using: :btree

  create_table "frame_draw_times", force: true do |t|
    t.string   "view_type"
    t.integer  "load_start_timestamp"
    t.integer  "load_finish_timestamp"
    t.string   "view_id"
    t.integer  "detail_report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "frame_draw_times", ["detail_report_id"], name: "index_frame_draw_times_on_detail_report_id", using: :btree

  create_table "memory_infos", force: true do |t|
    t.integer  "mem_total"
    t.integer  "dalvik_heap_alloc"
    t.integer  "native_heap_size"
    t.integer  "dalvik_heap_size"
    t.integer  "native_heap_alloc"
    t.integer  "mem_alloc"
    t.integer  "client_timestamp"
    t.integer  "detail_report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memory_infos", ["detail_report_id"], name: "index_memory_infos_on_detail_report_id", using: :btree

  create_table "motion_event_infos", force: true do |t|
    t.string   "activity_class"
    t.string   "param"
    t.string   "view"
    t.string   "action_type"
    t.integer  "sleep"
    t.integer  "client_timestamp"
    t.integer  "detail_report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "motion_event_infos", ["detail_report_id"], name: "index_motion_event_infos_on_detail_report_id", using: :btree

  create_table "motion_events", force: true do |t|
    t.string   "activity_class"
    t.string   "param"
    t.string   "view"
    t.string   "action_type"
    t.integer  "sleep"
    t.integer  "client_timestamp"
    t.integer  "test_scenario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "network_infos", force: true do |t|
    t.integer  "response_size"
    t.integer  "request_size"
    t.integer  "client_timestamp"
    t.integer  "detail_report_id"
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

  create_table "scenarioships", force: true do |t|
    t.integer  "total_report_id"
    t.integer  "test_scenario_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scenarioships", ["test_scenario_id"], name: "index_scenarioships_on_test_scenario_id", using: :btree
  add_index "scenarioships", ["total_report_id"], name: "index_scenarioships_on_total_report_id", using: :btree

  create_table "screens", force: true do |t|
    t.string   "image"
    t.boolean  "image_processing"
    t.integer  "client_timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_scenarios", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "export_code"
    t.string   "import_code_java"
    t.string   "import_code_class"
    t.string   "activity_name"
    t.string   "package_name"
    t.boolean  "file_type"
    t.integer  "rank",              default: 0
    t.integer  "project_id"
    t.integer  "scenarioship_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "test_scenarios", ["project_id"], name: "index_test_scenarios_on_project_id", using: :btree

  create_table "total_reports", force: true do |t|
    t.boolean  "status",        default: false
    t.integer  "apk_id"
    t.integer  "project_id"
    t.integer  "deviceship_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "total_reports", ["apk_id"], name: "index_total_reports_on_apk_id", using: :btree
  add_index "total_reports", ["project_id"], name: "index_total_reports_on_project_id", using: :btree

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

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
