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

ActiveRecord::Schema.define(:version => 20111001085353) do

  create_table "planned_events", :force => true do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.text     "comment"
    t.integer  "street_id"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "potential_customers", :force => true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mobile"
    t.string   "password"
    t.string   "payment_method"
  end

  create_table "streets", :force => true do |t|
    t.string   "streetname"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "northeast_lat"
    t.float    "northeast_lng"
    t.float    "southwest_lat"
    t.float    "southwest_lng"
    t.string   "address_components"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                        :null => false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "mobile"
    t.string   "payment_method"
  end

  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"

end
