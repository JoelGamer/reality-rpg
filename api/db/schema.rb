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

ActiveRecord::Schema.define(version: 2021_10_23_131116) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currencies_bases", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.string "symbol"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "currencies_conversions", force: :cascade do |t|
    t.bigint "from_currency_id", null: false
    t.bigint "to_currency_id", null: false
    t.decimal "exchange_value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["from_currency_id"], name: "index_currencies_conversions_on_from_currency_id"
    t.index ["to_currency_id"], name: "index_currencies_conversions_on_to_currency_id"
  end

  create_table "items_bases", force: :cascade do |t|
    t.string "name"
    t.integer "rarity", default: 0
    t.decimal "weight", default: "0.0"
    t.decimal "height", default: "0.0"
    t.decimal "width", default: "0.0"
    t.decimal "lenght", default: "0.0"
    t.string "item_type"
    t.bigint "item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_type", "item_id"], name: "index_items_bases_on_item"
  end

  create_table "items_currencies_bases", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locations_bases", force: :cascade do |t|
    t.string "name"
    t.string "location_type"
    t.bigint "location_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_type", "location_id"], name: "index_locations_bases_on_location"
  end

  create_table "locations_cities", force: :cascade do |t|
    t.decimal "money", default: "0.0"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "storages_bases", force: :cascade do |t|
    t.string "name"
    t.decimal "storage_units"
    t.string "storage_type"
    t.bigint "storage_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["storage_type", "storage_id"], name: "index_storages_bases_on_storage"
  end

  create_table "storages_metaphysicals", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users_bases", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users_inventories_bases", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "storage_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["storage_id"], name: "index_users_inventories_bases_on_storage_id"
    t.index ["user_id"], name: "index_users_inventories_bases_on_user_id"
  end

  create_table "users_inventories_items", force: :cascade do |t|
    t.bigint "inventory_id", null: false
    t.bigint "item_id", null: false
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["inventory_id"], name: "index_users_inventories_items_on_inventory_id"
    t.index ["item_id"], name: "index_users_inventories_items_on_item_id"
  end

  add_foreign_key "currencies_conversions", "currencies_bases", column: "from_currency_id"
  add_foreign_key "currencies_conversions", "currencies_bases", column: "to_currency_id"
  add_foreign_key "users_inventories_bases", "storages_bases", column: "storage_id"
  add_foreign_key "users_inventories_bases", "users_bases", column: "user_id"
  add_foreign_key "users_inventories_items", "items_bases", column: "item_id"
  add_foreign_key "users_inventories_items", "users_inventories_bases", column: "inventory_id"
end
