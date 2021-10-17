# frozen_string_literal: true

module Locations
  class CitySerializer < ActiveModel::Serializer
    attributes :id, :name, :money
  end
end
