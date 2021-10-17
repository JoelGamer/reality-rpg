class Currencies::BaseSerializer < ActiveModel::Serializer
  attributes :id, :name, :abbreviation, :symbol, :conversions

  def conversions
    Currencies::LoadConversions.new(object).call
  end
end