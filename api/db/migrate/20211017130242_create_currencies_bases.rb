class CreateCurrenciesBases < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies_bases do |t|
      t.string :name
      t.string :abbreviation
      t.string :symbol

      t.timestamps
    end
  end
end
