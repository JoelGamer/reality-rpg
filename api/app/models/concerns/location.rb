# frozen_string_literal: true

module Location
  extend ActiveSupport::Concern

  included do
    has_one :location, class_name: 'Locations::Base', as: :location, dependent: :destroy
  end

  delegate :name, to: :lazily_built_location
  delegate :name=, to: :lazily_built_location

  private

  def lazily_built_location
    location || build_location
  end
end
