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

ActiveRecord::Schema[7.0].define(version: 2022_04_07_025910) do
  create_table "authors", force: :cascade do |t|
    t.string "uuid"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mangas", force: :cascade do |t|
    t.string "uuid"
    t.string "original_title"
    t.string "en_title"
    t.string "pt_title"
    t.float "released_chapters", default: 0.0
    t.integer "released_volumes", default: 0
    t.integer "author_id"
    t.integer "publisher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_mangas_on_author_id"
    t.index ["publisher_id"], name: "index_mangas_on_publisher_id"
  end

  create_table "publishers", force: :cascade do |t|
    t.string "uuid"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_mangas", force: :cascade do |t|
    t.string "uuid"
    t.float "chapter_read", default: 0.0
    t.integer "volume_read", default: 0
    t.integer "volume_bought", default: 0
    t.integer "manga_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manga_id"], name: "index_user_mangas_on_manga_id"
    t.index ["user_id"], name: "index_user_mangas_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uuid"
    t.string "nickname"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "password_digest"
  end

  create_table "volumes", force: :cascade do |t|
    t.string "uuid"
    t.integer "number"
    t.string "cover"
    t.float "chapter_start"
    t.float "chapter_end"
    t.date "release_date"
    t.integer "manga_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manga_id"], name: "index_volumes_on_manga_id"
  end

  add_foreign_key "mangas", "authors"
  add_foreign_key "mangas", "publishers"
  add_foreign_key "user_mangas", "mangas"
  add_foreign_key "user_mangas", "users"
  add_foreign_key "volumes", "mangas"
end
