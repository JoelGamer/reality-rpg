# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

gold_currency = Currencies::Base.create!(name: 'City Central Gold', abbreviation: 'CCG', symbol: 'G$')
silver_currency = Currencies::Base.create!(name: 'City Central Silver', abbreviation: 'CCS', symbol: 'S$')
bronze_currency = Currencies::Base.create!(name: 'City Central Bronze', abbreviation: 'CCB', symbol: 'B$')

Currencies::Conversion.create!(from_currency: gold_currency, to_currency: silver_currency, exchange_value: 1000)
Currencies::Conversion.create!(from_currency: silver_currency, to_currency: bronze_currency, exchange_value: 1000)