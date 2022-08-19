# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: "admin@com",
  password: "hogehoge"
)

ShopTag.create([
  { name: "Wi-Fiあり" },
  { name: "電源あり" },
  { name: "30席以上" },
  { name: "個室あり" },
  { name: "落ち着いた雰囲気" },
  { name: "にぎやかな雰囲気" },
  { name: "キャッシュレス可" },
  { name: "駐車場あり" }
])
