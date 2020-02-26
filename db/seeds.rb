# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create do |a|
  a.id = 1
  a.email = 'user1@example.com'
  a.password = '111111'
  a.name = 'user1'
  a.postal_code = '1638001'
  a.prefecture_code = '東京都'
  a.city = '新宿区西新宿'
  a.street = '2-8-1'
end

User.create do |a|
  a.id = 2
  a.email = 'user2@example.com'
  a.password = '222222'
  a.name = 'user2'
  a.postal_code
  a.prefecture_code = '埼玉県'
  a.city = 'さいたま市浦和区高砂'
  a.street = '3-15-1-1'
end

User.create do |a|
  a.id = 3
  a.email = 'user3@example.com'
  a.password = '333333'
  a.name = 'user3'
  a.postal_code = '2608667'
  a.prefecture_code = '千葉市'
  a.city = '中央区市場町'
  a.street = '1-11'
end

Book.create do |a|
  a.id = 1
  a.title = 'book1'
  a.body = 'test'
  a.user_id = '1'
end

Book.create do |a|
  a.id = 2
  a.title = 'book2'
  a.body = 'test'
  a.user_id = '2'
end

Book.create do |a|
  a.id = 3
  a.title = 'book3'
  a.body = 'test'
  a.user_id = '3'
end
