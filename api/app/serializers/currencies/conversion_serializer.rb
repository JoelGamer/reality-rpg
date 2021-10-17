class Currencies::ConversionSerializer < ActiveModel::Serializer
  attributes :id, :from_currency_id, :to_currency_id, :exchange_value
end