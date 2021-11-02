# frozen_string_literal: true

module Items
  class Base < ApplicationRecord
    enum rarity: { common: 0, uncommon: 1, rare: 2, super_rare: 3, ultra_rare: 4, legendary: 5, ultimate: 6 }

    belongs_to :item, polymorphic: true
    validates :item_type, :item_id, presence: true

    validates :name, presence: true, uniqueness: true
    validates :weight, :height, :width, :lenght, presence: true

    def storage_units
      weight * ((height + width + lenght) / 3)
    end
  end
end
