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

ActiveRecord::Schema.define(:version => 20130226060651) do

  create_table "requests", :force => true do |t|
    t.integer  "requestID"
    t.integer  "tuteeID"
    t.integer  "tutorID"
    t.string   "day"
    t.time     "start"
    t.time     "end"
    t.string   "title"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "schedules", :force => true do |t|
    t.integer  "userID"
    t.string   "day"
    t.datetime "start"
    t.datetime "end"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tutorials", :force => true do |t|
    t.integer  "classID"
    t.integer  "tuteeID"
    t.integer  "tutorID"
    t.string   "day"
    t.time     "start"
    t.time     "end"
    t.string   "title"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "username"
    t.string   "usertype"
    t.string   "gender"
    t.date     "birthday"
    t.string   "location"
    t.string   "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "rating"
  end

end
