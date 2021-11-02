class CreateStoragesBases < ActiveRecord::Migration[6.1]
  def change
    create_table :storages_bases do |t|
      t.string :name
      t.decimal :storage_units
      t.references :storage, polymorphic: true

      t.timestamps
    end
  end
end
