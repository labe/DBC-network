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

ActiveRecord::Schema.define(:version => 20130619001052) do

  create_table "administrations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "answers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "question_id"
    t.string   "text"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cohorts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "companies", :force => true do |t|
    t.boolean  "activated"
    t.string   "website"
    t.string   "name"
    t.string   "logo"
    t.string   "location"
    t.string   "status"
    t.string   "initial_email_contact"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "faculties", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "git_hub_selections", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "interests", :force => true do |t|
    t.integer  "pitcher_id"
    t.integer  "catcher_id"
    t.boolean  "approved"
    t.datetime "email_sent_on"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "interests", ["catcher_id"], :name => "index_interests_on_catcher_id"
  add_index "interests", ["pitcher_id"], :name => "index_interests_on_pitcher_id"

  create_table "mentorships", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "questions", :force => true do |t|
    t.integer  "user_id"
    t.string   "text"
    t.string   "status",     :default => "active"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "users", :force => true do |t|
    t.boolean  "activated"
    t.string   "company_name"
    t.string   "email"
    t.string   "facebook_url"
    t.string   "first_name"
    t.string   "github_handle"
    t.string   "graduation_date"
    t.text     "intro"
    t.datetime "last_login"
    t.string   "last_name"
    t.string   "linkedin_url"
    t.string   "location"
    t.string   "password_digest"
    t.string   "phone"
    t.string   "status"
    t.string   "tumblr_url"
    t.string   "twitter_url"
    t.string   "groupable_type"
    t.integer  "groupable_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
