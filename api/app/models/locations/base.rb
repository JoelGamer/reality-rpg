# frozen_string_literal: true

module Locations
  class Base < ApplicationRecord
    belongs_to :location, polymorphic: true
    validates :location_type, :location_id, presence: true

    validates :name, presence: true, uniqueness: true
  end
end
