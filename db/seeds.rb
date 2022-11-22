# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
def separator_line
  puts "-------------------"
  puts "-------------------"
end

puts "Destroying all restaurants 🔥 "
Restaurant.destroy_all
puts "👽: Deleting all humans"
User.destroy_all

separator_line

ADDRESSES = [
  "1-291-8 Sarugakucho, Chiyoda ku, Tokyo to", #works
  "2-9 Sarugakucho, Chiyoda ku, Tokyo to", #works
  "14-6 Daita, Setagaya ku, Tokyo to", #works
  "4-12-6 Omotesando, Shibuya ku, Tokyo to", #works
  "3-15-24 Jingumae, Shibuya ku, Tokyo to", #works
  "7-2 Shinsencho, Shibuya ku, Tokyo to", #works
  "1-20-1 Shibuya, Shibuya ku, Tokyo to", #works
  "9 Sakuragaokacho, Shibuya ku, Tokyo to", #works
  "7-20 Nishishinjuku, Shinjuku ku, Tokyo to", #works
  "7-17 Nishishinjuku, Shinjuku ku, Tokyo to", #works
  "1-6 Hyakunincho, Shinjuku ku, Tokyo to", #works
  "1-3-7 Kabukicho, Shinjuku ku, Tokyo to", #works
  "3-35-16 Shinjuku, Shinjuku ku, Tokyo to", #works
  "1-54 Yoyogi, Shibuya ku, Tokyo to", #works
  "1-21 Shibuya, Shibuya ku, Tokyo to", #works
  "5-34 Jingumae, Shibuya ku, Tokyo to", #works
  "5-15 Roppongi, Minato ku, Tokyo to", #works
  "3-9-5 Roppongi, Minato ku, Tokyo to", #works
  "6-5 Roppongi, Minato ku, Tokyo to", #works
  "7-17 Roppongi, Minato ku, Tokyo to", #works
  "5-15-5 Roppongi, Minato ku, Tokyo to", #works
  "4-2 Shibakoen, Minato ku, Tokyo to", #works
  "9-8 Sakuragaokacho, Shibuya ku, Tokyo to", #works
  "2-13 Shibuya, Shibuya ku, Tokyo to", #works
  "4-2-12 Shibuya, Shibuya ku, Tokyo to", #works
  "32-12 Udagawacho, Shibuya ku, Tokyo to", #works
  # "2 Kamimeguro, Meguro ku, Tokyo to",
  # "4-3 Nakameguro, Meguro ku, Tokyo to",
  # "4-1 Nakameguro, Meguro ku, Tokyo to",
  "5-5 Ginza, Chuo ku, Tokyo to", #works
  "5-8 Ginza, Chuo ku, Tokyo to", #works
  "2-6 Ginza, Chuo ku, Tokyo to", #works
  "6-14 Ginza, Chuo ku, Tokyo to", #works
  "8-7 Ginza, Chuo ku, Tokyo to", #works
  "6-13 Ueno, Taito ku, Tokyo to", #works
  "4-9-2 Ueno, Taito ku, Tokyo to", #works
  "2-8-2 Ueno, Taito ku, Tokyo to", #works
  "3-19-4 Ueno, Taito ku, Tokyo to", #works
  "1-12 Higashiueno, Taito ku, Tokyo to", #works
  "1-29-4 Senju, Adachi ku, Tokyo to", #works
  "2-7 Senju, Adachi ku, Tokyo to", #works
  "3-58 Senju, Adachi ku, Tokyo to", #works
  "2-24 Kitazawa, Setagaya ku, Tokyo to", #works
  "2-29 Kitazawa, Setagaya ku, Tokyo to", #works
  "3-20 Kitazawa, Setagaya ku, Tokyo to", #works
  "2-17-3 Kitazawa, Setagaya ku, Tokyo to", #works
  "5-35 Daita, Setagaya ku, Tokyo to", #works
  "1-28 Yoyogi, Shibuya ku, Tokyo to", #works
  "5-13 Sendagaya, Shibuya ku, Tokyo to", #works
  "1-8 Jingumae, Shibuya Ku, Tokyo to", #works
  "6-12 Jingumae, Shibuya Ku, Tokyo to", #works
  "1-3 Shoto, Shibuya ku, Tokyo to", #works
  "10-15 Maruyamacho, Shibuya ku, Tokyo to", #works
]

puts "Generating humans 🤪"
5.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: Faker::Internet.password(min_length: 8),
    name: Faker::Internet.unique.username
  )
end

separator_line
puts "Building restaurants 🚧"
seed_addresses = ADDRESSES.shuffle
index = 0
40.times do
  restaurant = Restaurant.create!(
    user: User.all.sample,
    name: Faker::Restaurant.name,
    category: Faker::Food.ethnic_category,
    address: seed_addresses[index],
    maximum_number: rand(1..30),
    price_range: ["¥", "¥¥", "¥¥¥", "¥¥¥¥"].sample
  )
  index += 1
  puts "Searching for an image for #{restaurant.name} 🌇"
  file = URI.open("http://source.unsplash.com/featured/?#{restaurant.category}")
  restaurant.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
  restaurant.save
end

separator_line
puts "Adding some tags #️⃣"
mood = ["Hip", "Casual", "Relaxing", "Party", "Chill", "Energetic", "Modern"]
45.times do
  mood_restaurant = Restaurant.all.sample
  mood_restaurant.tag_list.add(mood.sample)
  puts "#{mood_restaurant.name} is now: #{mood_restaurant.tag_list}"
  mood_restaurant.save
end

separator_line
puts "Generating Ozei 💎"
puts "....Soren created! 🤠"
User.create!(
  email: "soren@ozei.fun",
  password: "123123",
  name: "Soren"
)
puts "....Mattias created! 🤓"
User.create!(
  email: "mattias@ozei.fun",
  password: "123123",
  name: "Mattias"
)
puts "....Erika created! 💃🏻"
User.create!(
  email: "Erika@ozei.fun",
  password: "123123",
  name: "Erika"
)
puts "....Yumi created! 👩🏻"
User.create!(
  email: "Yumi@ozei.fun",
  password: "123123",
  name: "Yumi"
)

#seeds for booking
Booking.create!(
  user: User.find(17), #set the user who made the bookign(In this case Erika id: 17)
  restaurant:  Restaurant.find(51), #set the restaurant that Erika booked.(In this case Erika booked "Yumi's fat curry" id: 51)
  number_of_people: 10
)
