# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_02_14_073023) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.string "author"
    t.text "content"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "dictionaries", force: :cascade do |t|
    t.string "words", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "kids", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.bigint "user_id", null: false
    t.bigint "dictionary_id", null: false
    t.string "ethnicity"
    t.string "gender_identity"
    t.string "sexual_orientation"
    t.date "birthday"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["dictionary_id"], name: "index_kids_on_dictionary_id"
    t.index ["user_id"], name: "index_kids_on_user_id"
  end

  create_table "statistics", force: :cascade do |t|
    t.integer "total_tweets"
    t.integer "angry_tweets"
    t.integer "sad_tweets"
    t.integer "fearful_tweets"
    t.integer "joyful_tweets"
    t.integer "analytical_tweets"
    t.integer "confident_tweets"
    t.integer "tentative_tweets"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "kid_id"
    t.index ["kid_id"], name: "index_statistics_on_kid_id"
  end

  create_table "suggestions", force: :cascade do |t|
    t.string "word"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "kids", "dictionaries"
  add_foreign_key "kids", "users"
end
