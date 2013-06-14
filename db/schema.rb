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

ActiveRecord::Schema.define(:version => 20130613223833) do

  create_table "account_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cohorts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "website"
    t.string   "name"
    t.string   "logo"
    t.string   "location"
    t.string   "status"
    t.string   "initial_email_contact"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "employers", :force => true do |t|
    t.integer  "company_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "employers", ["company_id"], :name => "index_employers_on_company_id"
  add_index "employers", ["user_id"], :name => "index_employers_on_user_id"

  create_table "interests", :force => true do |t|
    t.integer  "employer_id"
    t.integer  "student_id"
    t.integer  "who_initiated_id"
    t.string   "approved"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "interests", ["employer_id"], :name => "index_interests_on_employer_id"
  add_index "interests", ["student_id"], :name => "index_interests_on_student_id"

  create_table "students", :force => true do |t|
    t.integer  "cohort_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "students", ["cohort_id"], :name => "index_students_on_cohort_id"
  add_index "students", ["user_id"], :name => "index_students_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "access_key"
    t.integer  "account_type_id"
    t.boolean  "approved"
    t.string   "avatar"
    t.string   "email"
    t.string   "first_name"
    t.string   "github_handle"
    t.string   "graduation_date"
    t.text     "intro"
    t.datetime "last_login"
    t.string   "last_name"
    t.string   "location"
    t.string   "password_digest"
    t.string   "phone"
    t.string   "status"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
