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

ActiveRecord::Schema.define(version: 2021_10_23_001240) do

  create_table "answers", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "user_id"
    t.integer "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "department_id"
  end

  create_table "categories_tags", force: :cascade do |t|
    t.integer "category_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lineitems", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "price"
    t.integer "order_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cart_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "email"
    t.string "card_number"
    t.string "card_expiration_date"
    t.string "card_verification"
    t.string "bill_firstname"
    t.string "bill_lastname"
    t.string "bill_address1"
    t.string "bill_address2"
    t.string "bill_city"
    t.string "bill_state"
    t.string "bill_zipcode"
    t.string "ship_firstname"
    t.string "ship_lastname"
    t.string "ship_address1"
    t.string "ship_address2"
    t.string "ship_city"
    t.string "ship_state"
    t.string "ship_zipcode"
    t.string "phone"
    t.decimal "total"
    t.integer "customer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.string "description"
    t.integer "seller_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products_tags", force: :cascade do |t|
    t.integer "product_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "customer_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "title"
    t.string "description"
    t.integer "customer_id"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "tag_id"
    t.integer "product_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_taggings_on_category_id"
    t.index ["product_id"], name: "index_taggings_on_product_id"
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.boolean "support", default: false
    t.boolean "seller", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
