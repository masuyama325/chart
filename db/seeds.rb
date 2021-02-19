# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

CSV.foreach('./db/225.csv', headers: true) do |row|   # hogeは配列クラス
  CandleStick.create!(
              date:     row['date'],
              open:     row['open'],
              high:     row['high'],
              low:      row['low'],
              close:    row['close']
  )
end
