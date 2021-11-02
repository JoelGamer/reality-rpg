class Users::Inventories::Item < ApplicationRecord
  belongs_to :inventory, class_name: 'Users::Inventories::Base', inverse_of: false
  belongs_to :item, class_name: 'Items::Base', inverse_of: false

  def used_storage_units
    self.item.storage_units * self.quantity
  end
end
