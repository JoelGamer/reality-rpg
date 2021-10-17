# frozen_string_literal: true

module Currencies
  class Conversion < ApplicationRecord
    belongs_to :from_currency, class_name: 'Currencies::Base', inverse_of: false, dependent: :destroy
    belongs_to :to_currency, class_name: 'Currencies::Base', inverse_of: false, dependent: :destroy
  end
end
