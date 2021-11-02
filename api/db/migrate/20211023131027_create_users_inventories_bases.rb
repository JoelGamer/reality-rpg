class CreateUsersInventoriesBases < ActiveRecord::Migration[6.1]
  def change
    create_table :users_inventories_bases do |t|
      t.references :user, null: false, foreign_key: { to_table: :users_bases }
      t.references :storage, null: false, foreign_key: { to_table: :storages_bases }

      t.timestamps
    end
  end
end
