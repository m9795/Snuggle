# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!(
  [
    {email: 'olivia@test.com', name: 'Olivia', password: 'password', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'james@test.com', name: 'James', password: 'password', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'lucas@test.com', name: 'Lucas', password: 'password', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")}
  ]
)

Post.create!(
  [
    {title: '流行りのカフェ', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), content: '最近、大人気のカフェです。 #cafe', user_id: users[0].id },
    {title: '落ち着くお気に入りのカフェ', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), content: '落ち着いた雰囲気のカフェです。 #cafe #カフェ', user_id: users[1].id },
    {title: 'メニューが多いカフェ', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), content: '種類がたくさん選べるのでコーヒー好きの方おすすめです！ #coffe', user_id: users[2].id }
  ]
)

Admin.create!(
  email: "admin@com",
  password: "hogehoge"
)

ShopTag.create([
  { name: "Wi-Fiあり" },
  { name: "電源あり" },
  { name: "30席以上" },
  { name: "個室あり" },
  { name: "予約可" },
  { name: "BGMあり" },
  { name: "落ち着いた雰囲気" },
  { name: "にぎやかな雰囲気" },
  { name: "キャッシュレス可" },
  { name: "駐車場あり" }
])
