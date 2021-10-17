module Item
  extend ActiveSupport::Concern

  included do
    has_one :item, class_name: 'Item::Base', :as => :item
  end

  delegate :name, :rarity, :weight, :height, :width, :lenght, to: :lazily_built_item
  delegate :name=, :rarity=, :weight=, :height=, :width=, :lenght=, to: :lazily_built_item

  private

  def lazily_built_item
    item || build_item
  end
end