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

ActiveRecord::Schema.define(version: 20170219050647) do

  create_table "actor_movies", force: :cascade do |t|
    t.integer  "actor_id"
    t.integer  "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "actors", force: :cascade do |t|
    t.string   "name"
    t.integer  "actor_movie_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "name_ja"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.integer  "country_movie_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "directors", force: :cascade do |t|
    t.string   "name"
    t.integer  "director_movie_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "name_ja"
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.integer  "released_year"
    t.integer  "actor_movie_id", default: 0, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "title_ja"
    t.integer  "director_id",    default: 0, null: false
    t.integer  "country_id",     default: 0, null: false
  end

  create_table "tv_programs", force: :cascade do |t|
    t.string   "title"
    t.string   "title_ja"
    t.integer  "released_year"
    t.integer  "movie_id",            default: 0, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.datetime "on_air_date"
    t.integer  "country_id",          default: 0, null: false
    t.integer  "leading_actor_id",    default: 0, null: false
    t.integer  "supporting_actor_id", default: 0, null: false
    t.integer  "director_id",         default: 0, null: false
  end

end
