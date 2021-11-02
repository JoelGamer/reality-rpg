class CreateUsersInventoriesItems < ActiveRecord::Migration[6.1]
  def change
    create_table :users_inventories_items do |t|
      t.references :inventory, null: false, foreign_key: { to_table: :users_inventories_bases }
      t.references :item, null: false, foreign_key: { to_table: :items_bases }
      t.integer :quantity

      t.timestamps
    end
  end
end
