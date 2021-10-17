# frozen_string_literal: true

module Currencies
  class BaseSerializer < ActiveModel::Serializer
    attributes :id, :name, :abbreviation, :symbol, :conversions

    def conversions
      Currencies::LoadConversions.new(object).call
    end
  end
end
