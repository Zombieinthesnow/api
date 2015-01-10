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

ActiveRecord::Schema.define(version: 20140813040453) do

  create_table "bike_stations", force: true do |t|
    t.string   "name"
    t.string   "terminal_name"
    t.integer  "last_comm_with_server"
    t.float    "lat"
    t.float    "long"
    t.string   "installed"
    t.string   "locked"
    t.integer  "install_date"
    t.integer  "removal_date"
    t.string   "temporary"
    t.string   "public_station"
    t.integer  "num_of_bikes"
    t.integer  "num_of_empty_docks"
    t.integer  "latest_updated_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "bike_station_id"
  end

end
