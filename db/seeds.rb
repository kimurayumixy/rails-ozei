# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Restaurant.destroy_all
User.destroy_all

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

puts "Creating Soren"
  User.create!(
    email: "soren@ozei.fun",
    password: "123123",
    name: "Soren"
  )
puts "Creating Mattias"
User.create!(
  email: "mattias@ozei.fun",
  password: "123123",
  name: "Mattias"
)
puts "Creating Erika"
User.create!(
  email: "Erika@ozei.fun",
  password: "123123",
  name: "Erika"
)
puts "Creating Yumi"
User.create!(
  email: "Yumi@ozei.fun",
  password: "123123",
  name: "Yumi"
)
