# frozen_string_literal: true

module Currencies
  class Base < ApplicationRecord
    has_many :conversions, class_name: 'Currencies::Conversion', foreign_key: 'from_currency_id', inverse_of: false,
                           dependent: :destroy

    validates :name, :abbreviation, :symbol, presence: true, uniqueness: true
  end
end
