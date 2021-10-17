class Currencies::Base < ApplicationRecord
  has_many :conversions, class_name: 'Currencies::Conversion', foreign_key: 'from_currency_id'

  validates :name, :abbreviation, :symbol, presence: true, uniqueness: true
end
