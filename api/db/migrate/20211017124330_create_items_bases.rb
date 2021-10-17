class CreateItemsBases < ActiveRecord::Migration[6.1]
  def change
    create_table :items_bases do |t|
      t.string :name
      t.integer :rarity, :default => 0
      t.decimal :weight, :default => 0
      t.decimal :height, :default => 0
      t.decimal :width, :default => 0
      t.decimal :lenght, :default => 0
      t.references :item, polymorphic: true

      t.timestamps
    end
  end
end
