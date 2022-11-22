# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Restaurant.destroy_all
User.destroy_all
ADDRESSES = [
  "1-291-8 Sarugakucho, Chiyoda ku, Tokyo to",
  "14-6-5 Daita, Setagaya ku, Tokyo to",
  "4-12-6 Omotesando, Shibuya ku, Tokyo to",
  "3-15-24 Jingumae, Shibuya ku, Tokyo to",
  "7-2 Shinsencho, Shibuya ku, Tokyo to",
  "1-20-1 Shibuya, Shibuya ku, Tokyo to",
  "9 Sakuragaokacho, Shibuya ku, Tokyo to",
  "7-20-1 Nishishinjuku, Shinjuku ku, Tokyo to",
  "7-17-10 Nishishinjuku, Shinjuku ku, Tokyo to",
  "1-6-27 Hyakunincho, Shinjuku ku, Tokyo to",
  "1-3-7 Kabukicho, Shinjuku ku, Tokyo to",
  "3-35-16 Shinjuku, Shinjuku ku, Tokyo to",
  "1-54-11 Yoyogi, Shibuya ku, Tokyo to",
  "1-21 Shibuya, Shibuya ku, Tokyo to",
  "5-34-15 Jingumae, Shibuya ku, Tokyo to",
  "3-19-21 Nishiazabu, Minato ku, Tokyo to",
  "1-5-24 Nishiazabu, Minato ku, Tokyo to",
  "6-5-19 Roppongi, Minato ku, Tokyo to",
  "7-17-10 Roppongi, Minato ku, Tokyo to",
  "5-15-5 Roppongi, Minato ku, Tokyo to",
  "3-2-26 Nishiazabu, Minato ku, Tokyo to",
  "3-12-7 Kamimeguro, Meguro ku, Tokyo to",
  "2-12-8 Kamimeguro, Meguro ku, Tokyo to",
  "3-3-6 Nakameguro, Meguro ku, Tokyo to",
  "3-14 Nakameguro, Meguro ku, Tokyo to",
  "5-5-15 Ginza, Chuo ku, Tokyo to",
  "5-8-20 Ginza, Chuo ku, Tokyo to",
  "2-6-9 Ginza, Chuo ku, Tokyo to",
  "6-14-10 Ginza, Chuo ku, Tokyo to",
  "8-7-21 Ginza, Chuo ku, Tokyo to",
  "6-13-9 Ueno, Taito ku, Tokyo to",
  "4-9-2 Ueno, Taito ku, Tokyo to",
  "2-8-2 Ueno, Taito ku, Tokyo to",
  "3-19-4 Ueno, Taito ku, Tokyo to",
  "1-12 Higashiueno, Taito ku, Tokyo to",
  "1-29-4 Senju, Adachi ku, Tokyo to",
  "2-7 Senju, Adachi ku, Tokyo to",
  "3-58-10 Senju, Adachi ku, Tokyo to",
  "2-24-9 Kitazawa, Setagaya ku, Tokyo to",
  "2-29-13 Kitazawa, Setagaya ku, Tokyo to",
  "3-20-9 Kitazawa, Setagaya ku, Tokyo to",
  "2-17-3 Kitazawa, Setagaya ku, Tokyo to",
  "5-35-29 Daita, Setagaya ku, Tokyo to",
  "1-28 Yoyogi, Shibuya ku, Tokyo to",
  "5-13 Sendagaya, Shibuya ku, Tokyo to",
  "1-8 Jingumae, Shibuya Ku, Tokyo to",
  "6-12-27 Jingumae, Shibuya Ku, Tokyo to",
  "1-3 Shoto, Shibuya ku, Tokyo to",
  "10-15 Maruyamacho, Shibuya ku, Tokyo to",
  "1-20-1 Dogenzaka, Shibuya ku, Tokyo to"
]
5.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password(min_length: 8),
    name: Faker::Internet.unique.username
  )
end

25.times do
  restaurant = Restaurant.create!(
    user: User.all.sample,
    name: Faker::Restaurant.name,
    category: Faker::Food.ethnic_category,
    address: Faker::Address.street_address,
    maximum_number: rand(1..30),
    price_range: ["¥", "¥¥", "¥¥¥", "¥¥¥¥"].sample
  )
  puts "Searching for an image for a #{restaurant.name}"
  file = URI.open("http://source.unsplash.com/featured/?#{restaurant.category}")
  restaurant.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
  restaurant.save
end
