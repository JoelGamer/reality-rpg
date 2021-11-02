class CreateUsersBases < ActiveRecord::Migration[6.1]
  def change
    create_table :users_bases do |t|
      t.string :name

      t.timestamps
    end
  end
end
