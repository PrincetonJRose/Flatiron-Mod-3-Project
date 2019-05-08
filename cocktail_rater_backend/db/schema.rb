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

ActiveRecord::Schema.define(version: 2019_05_08_150329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dislikes", force: :cascade do |t|
    t.integer "drinkid"
    t.integer "userid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drinks", force: :cascade do |t|
    t.integer "id_drink"
    t.string "name"
    t.text "instructions"
    t.string "category"
    t.boolean "alcoholic"
    t.string "glass"
    t.string "videoURL"
    t.string "imageURL"
    t.integer "ingredientid_1"
    t.integer "ingredientid_2"
    t.integer "ingredientid_3"
    t.integer "ingredientid_4"
    t.integer "ingredientid_5"
    t.integer "ingredientid_6"
    t.integer "ingredientid_8"
    t.integer "ingredientid_9"
    t.integer "ingredientid_10"
    t.integer "ingredientid_11"
    t.integer "ingredientid_12"
    t.integer "ingredientid_13"
    t.integer "ingredientid_14"
    t.integer "ingredientid_15"
    t.string "measure1"
    t.string "measure2"
    t.string "measure3"
    t.string "measure4"
    t.string "measure5"
    t.string "measure6"
    t.string "measure7"
    t.string "measure8"
    t.string "measure9"
    t.string "measure10"
    t.string "measure11"
    t.string "measure12"
    t.string "measure13"
    t.string "measure14"
    t.string "measure15"
    t.integer "userid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.integer "id_ingredient"
    t.string "name"
    t.string "category"
    t.text "description"
    t.string "imageURL"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer "drinkid"
    t.integer "userid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "drinkid"
    t.integer "userid"
    t.text "review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "imageURL"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
