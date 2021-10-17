# frozen_string_literal: true

module Currencies
  class LoadConversions
    attr_reader :currency

    def initialize(currency)
      @currency = currency
    end

    def call
      load_conversions
    end

    private

    def load_conversions
      [Currencies::Conversion.find_by(from_currency: @currency),
       Currencies::Conversion.find_by(to_currency: @currency)].flatten.compact
    end
  end
end
