class CreateLocationsBases < ActiveRecord::Migration[6.1]
  def change
    create_table :locations_bases do |t|
      t.string :name
      t.references :location, polymorphic: true

      t.timestamps
    end
  end
end
