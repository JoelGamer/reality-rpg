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

ActiveRecord::Schema.define(version: 2021_10_17_130533) do

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
    t.integer "rarity"
    t.decimal "weight"
    t.decimal "height"
    t.decimal "width"
    t.decimal "lenght"
    t.string "item_type"
    t.bigint "item_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["item_type", "item_id"], name: "index_items_bases_on_item"
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

  add_foreign_key "currencies_conversions", "currencies_bases", column: "from_currency_id"
  add_foreign_key "currencies_conversions", "currencies_bases", column: "to_currency_id"
end
