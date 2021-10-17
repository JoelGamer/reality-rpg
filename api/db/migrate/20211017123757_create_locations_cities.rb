class CreateLocationsCities < ActiveRecord::Migration[6.1]
  def change
    create_table :locations_cities do |t|
      t.decimal :money, :default => 0

      t.timestamps
    end
  end
end
