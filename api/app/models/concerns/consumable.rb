# frozen_string_literal: true

module Consumable
  extend ActiveSupport::Concern

  included do
    has_one :consumable, class_name: 'Item::Consumable::Base', as: :consumable, dependent: :destroy
  end

  delegate :name, :rarity, :weight, :height, :width, :lenght, to: :lazily_built_consumable
  delegate :name=, :rarity=, :weight=, :height=, :width=, :lenght=, to: :lazily_built_consumable

  private

  def lazily_built_consumable
    consumable || build_consumable
  end
end
