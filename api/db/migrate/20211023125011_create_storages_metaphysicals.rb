class CreateStoragesMetaphysicals < ActiveRecord::Migration[6.1]
  def change
    create_table :storages_metaphysicals do |t|
      t.timestamps
    end
  end
end
