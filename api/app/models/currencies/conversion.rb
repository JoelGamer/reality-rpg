class Currencies::Conversion < ApplicationRecord
  belongs_to :from_currency, class_name: 'Currencies::Base', inverse_of: false, dependent: :destroy
  belongs_to :to_currency, class_name: 'Currencies::Base', inverse_of: false, dependent: :destroy
end
