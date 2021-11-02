# frozen_string_literal: true

gold_currency = Currencies::Base.create!(name: 'City Central Gold', abbreviation: 'CCG', symbol: 'G$')
silver_currency = Currencies::Base.create!(name: 'City Central Silver', abbreviation: 'CCS', symbol: 'S$')
bronze_currency = Currencies::Base.create!(name: 'City Central Bronze', abbreviation: 'CCB', symbol: 'B$')

Currencies::Conversion.create!(from_currency: gold_currency, to_currency: silver_currency, exchange_value: 1000)
Currencies::Conversion.create!(from_currency: silver_currency, to_currency: bronze_currency, exchange_value: 1000)

Items::Currencies::Base.create!(name: gold_currency.name, rarity: Items::Base.rarities[:common], weight: 0.1, height: 0.1, width: 0.1, lenght: 0.1)
Items::Currencies::Base.create!(name: silver_currency.name, rarity: Items::Base.rarities[:common], weight: 0.1, height: 0.1, width: 0.1, lenght: 0.1)
Items::Currencies::Base.create!(name: bronze_currency.name, rarity: Items::Base.rarities[:common], weight: 0.1, height: 0.1, width: 0.1, lenght: 0.1)

Users::Base.create!(name: 'Administrator')