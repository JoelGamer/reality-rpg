class CreateItemsCurrenciesBases < ActiveRecord::Migration[6.1]
  def change
    create_table :items_currencies_bases do |t|

      t.timestamps
    end
  end
end
