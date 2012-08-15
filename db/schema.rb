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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120815192325) do

  create_table "affiliations", :force => true do |t|
    t.integer  "group_id"
    t.integer  "child_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "affiliations", ["child_id"], :name => "index_affiliations_on_child_id"
  add_index "affiliations", ["group_id", "child_id"], :name => "index_affiliations_on_group_id_and_child_id", :unique => true
  add_index "affiliations", ["group_id"], :name => "index_affiliations_on_group_id"

  create_table "appointments", :force => true do |t|
    t.integer  "group_id"
    t.date     "date_at"
    t.boolean  "canceled"
    t.integer  "reason"
    t.string   "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "appointments", ["group_id", "date_at"], :name => "index_appointments_on_group_id_and_date_at"

  create_table "attendances", :force => true do |t|
    t.integer  "appointment_id"
    t.integer  "child_id"
    t.boolean  "absence"
    t.integer  "reason"
    t.string   "comment"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "attendances", ["appointment_id", "child_id"], :name => "index_attendances_on_appointment_id_and_child_id", :unique => true
  add_index "attendances", ["appointment_id"], :name => "index_attendances_on_appointment_id"
  add_index "attendances", ["child_id"], :name => "index_attendances_on_child_id"

  create_table "children", :force => true do |t|
    t.string   "lastname"
    t.string   "firstname"
    t.date     "born_at"
    t.boolean  "female"
    t.integer  "zipcode"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "groups", :force => true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.date     "starts_at"
    t.date     "ends_at"
    t.integer  "agegroup"
    t.integer  "category"
    t.integer  "duration"
    t.integer  "intermittency"
    t.boolean  "kindergarden"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "groups", ["user_id", "starts_at"], :name => "index_groups_on_user_id_and_starts_at"

  create_table "users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
