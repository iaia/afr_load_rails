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

ActiveRecord::Schema.define(version: 20170514075103) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.string   "domain"
    t.string   "ability"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "actor_movies", force: :cascade do |t|
    t.integer  "actor_id"
    t.integer  "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "actor_thumbnails", force: :cascade do |t|
    t.integer  "actor_id"
    t.string   "path"
    t.integer  "file_size"
    t.string   "caption"
    t.boolean  "view_status"
    t.boolean  "status"
    t.boolean  "removed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "actors", force: :cascade do |t|
    t.string   "name"
    t.string   "name_ja"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comment_contents", force: :cascade do |t|
    t.string   "url"
    t.string   "expanded_url"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "comment_id",   default: 0, null: false
  end

  create_table "comment_providers", force: :cascade do |t|
    t.string   "name"
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string   "body"
    t.string   "user_name"
    t.integer  "provider_id"
    t.datetime "commented_time"
    t.integer  "tv_program_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "comment_id_on_provider"
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "directors", force: :cascade do |t|
    t.string   "name"
    t.string   "name_ja"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movie_thumbnails", force: :cascade do |t|
    t.integer  "movie_id"
    t.string   "path"
    t.integer  "file_size"
    t.string   "caption"
    t.boolean  "view_status"
    t.boolean  "status"
    t.boolean  "removed"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.string   "title_ja"
    t.integer  "director_id",      default: 0, null: false
    t.integer  "country_id",       default: 0, null: false
    t.integer  "released_year"
    t.integer  "released_country", default: 0, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "story"
  end

  create_table "recordeds", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tv_program_id"
    t.boolean  "recorded",      default: true,  null: false
    t.boolean  "removed",       default: false, null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "role_abilities", force: :cascade do |t|
    t.integer  "role_id"
    t.integer  "ability_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "nickname"
    t.string   "email"
    t.string   "url"
    t.string   "image_url"
    t.string   "description"
    t.string   "other"
    t.string   "credentials"
    t.string   "raw_info"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["user_id"], name: "index_social_profiles_on_user_id", using: :btree
  end

  create_table "topics", force: :cascade do |t|
    t.integer  "tv_program_infomation_id"
    t.string   "term"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "tv_program_infomations", force: :cascade do |t|
    t.string   "name"
    t.integer  "on_air_minutes"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "tv_programs", force: :cascade do |t|
    t.datetime "on_air_date"
    t.string   "title"
    t.string   "title_ja"
    t.integer  "director_id",         default: 0, null: false
    t.integer  "released_year"
    t.integer  "country_id",          default: 0, null: false
    t.integer  "leading_actor_id",    default: 0, null: false
    t.integer  "supporting_actor_id", default: 0, null: false
    t.integer  "movie_id",            default: 0, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.datetime "on_air_start"
    t.datetime "on_air_end"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "nickname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "role_id",    null: false
    t.index ["name"], name: "index_users_on_name", unique: true, using: :btree
  end

  create_table "watched_movies", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "movie_id"
    t.boolean  "watched",      default: false, null: false
    t.datetime "watched_date"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "watched_tv_programs", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "tv_program_id"
    t.boolean  "watched",           default: false, null: false
    t.boolean  "real_time_watched", default: false, null: false
    t.datetime "watched_date"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_foreign_key "social_profiles", "users"
end
