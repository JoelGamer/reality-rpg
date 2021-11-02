class Users::Inventories::AddRemoveItem
  attr_reader :inventory, :item, :quantity 
  
  def initialize(inventory, item, quantity)
    @inventory = inventory
    @item = item
    @quantity = quantity
  end

  def add_item
    raise StandardError if @inventory.is_full?(@item, @quantity)
    Users::Inventories::Item.find_by_or_create!(inventory: @inventory, item: @item, quantity: @quantity)
  end

  def remove_item
    inventory_item = Users::Inventories::Item.find_by(inventory: @inventory, item: @item)
    inventory_item.update!(quantity: inventory_item.quantity - @quantity) unless inventory_item.nil?
  end
end