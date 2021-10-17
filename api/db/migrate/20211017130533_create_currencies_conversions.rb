# frozen_string_literal: true

class CreateCurrenciesConversions < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies_conversions do |t|
      t.references :from_currency, null: false, foreign_key: { to_table: :currencies_bases }
      t.references :to_currency, null: false, foreign_key: { to_table: :currencies_bases }
      t.decimal :exchange_value

      t.timestamps
    end
  end
end
