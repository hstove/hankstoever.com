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

ActiveRecord::Schema.define(version: 20130724000644) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "afterparty_jobs", force: true do |t|
    t.text     "job_dump"
    t.string   "queue"
    t.datetime "execute_at"
    t.boolean  "completed"
    t.boolean  "has_error"
    t.text     "error_message"
    t.text     "error_backtrace"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "subscribed"
    t.boolean  "handbook"
  end

  create_table "posts", force: true do |t|
    t.datetime "posted_at"
    t.text     "body"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.integer  "points"
    t.integer  "views"
  end

end
