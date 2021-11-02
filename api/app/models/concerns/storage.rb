# frozen_string_literal: true

module Storage
  extend ActiveSupport::Concern

  included do
    has_one :storage, class_name: 'Storages::Base', as: :storage, dependent: :destroy
  end

  delegate :name, :storage_units, to: :lazily_built_storage
  delegate :name=, :storage_units=, to: :lazily_built_storage

  private

  def lazily_built_storage
    storage || build_storage
  end
end
