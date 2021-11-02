class Users::Inventories::Base < ApplicationRecord
  before_validation :create_storage

  belongs_to :user, class_name: 'Users::Base'
  belongs_to :storage, class_name: 'Storages::Base'
  has_many :items, class_name: 'Users::Inventories::Item', foreign_key: "inventory_id", inverse_of: false, dependent: :destroy

  def is_full?(item = nil, quantity = 1)
    aditional_units = item.storage_units * quantity unless item.nil?
    self.storage.storage_units <= items_storage_units_sum + aditional_units.to_f
  end

  private

  def create_storage
    self.storage = Storages::Metaphysical.create!(name: "#{self.user.name} Inventory", storage_units: 70).storage
  end

  def items_storage_units_sum
    self.items.map(&:used_storage_units).sum
  end
end
