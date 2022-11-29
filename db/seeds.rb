require 'net/http'
require 'uri'
require 'json'

def separator_line
  puts "-------------------"
  puts "-------------------"
end

def destroy_all_things
  puts "Destorying all bookings! 😈"
  Booking.destroy_all
  puts "Destroying all restaurants 🔥"
  Restaurant.destroy_all
  puts "Deleting all humans 👽"
  User.destroy_all
  separator_line
end

def create_users
  puts "Generating humans 🤪"
  5.times do
    User.create!(
      email: Faker::Internet.unique.email,
      password: Faker::Internet.password(min_length: 8),
      name: Faker::Internet.unique.username
    )
  end
  separator_line
end

def add_restaurant_moods(restaurant)
  my_restaurant = restaurant
  puts "Adding some tags #️⃣"
  mood = ["Hip", "Casual", "Relaxing", "Party", "Chill", "Energetic", "Modern", "Fancy"]
  my_restaurant.tag_list.add(mood.sample)
  puts "#{my_restaurant.name} is now: #{my_restaurant.tag_list} 🤙🏻"
  my_restaurant.save
end

def create_hotpepper_restaurants(category)
  puts "Getting Hotpepper restaurants 🌶️"
  key = "eb23cb3ca1015ddc"
  url = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=#{key}&name=#{category}&large_area=Z011&format=json"
  api = URI.parse(url)
  json = Net::HTTP.get(api)
  parse_result = JSON.parse(json)
  @result = parse_result["results"]["shop"]

  puts "Creating 10x #{category} ⬅️"
  @result.each do |restaurant|
    new_restaurant = Restaurant.create!(
      user: User.all.sample,
      name: restaurant["name"],
      description: Faker::Restaurant.description,
      category: restaurant["genre"]["name"],
      address: restaurant["address"],
      longitude: restaurant["lng"],
      latitude: restaurant["lat"],
      maximum_number: restaurant["capacity"],
      price_range: "¥ #{[1000,2000,3000,4000,5000,6000,7000,8000,9000,10000].sample}"
    )
    file = URI.open("#{restaurant["photo"]["pc"]["l"]}")
    new_restaurant.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
    add_restaurant_moods(new_restaurant)
    new_restaurant.save
  end
  separator_line
  puts "Finished creating #{category}-restaurants"
end

# Creating all random stuff
destroy_all_things
create_users

create_hotpepper_restaurants("izakaya")
create_hotpepper_restaurants("italian")
create_hotpepper_restaurants("french")
create_hotpepper_restaurants("bar")
create_hotpepper_restaurants("chinese")
create_hotpepper_restaurants("asia")
create_hotpepper_restaurants("karaoke")

# Creating all Ozei Accounts
puts "Generating Ozei 💎"
puts "....Soren created! 🤠"
soren = User.create!(
  email: "soren@ozei.fun",
  password: "123123",
  name: "Soren"
)
soren_img = "https://res.cloudinary.com/dmnm5ct2h/image/upload/v1669602938/Ozei/user_egrawp.jpg"
file = URI.open(soren_img)
soren.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

puts "....Mattias created! 🤓"
mattias = User.create!(
  email: "mattias@ozei.fun",
  password: "123123",
  name: "Mattias"
)
mattias_img = "https://res.cloudinary.com/dmnm5ct2h/image/upload/v1669606745/Ozei/user2_uqspmm.jpg"
file = URI.open(mattias_img)
mattias.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

puts "....Yumi created! 👩🏻"
yumi = User.create!(
  email: "Yumi@ozei.fun",
  password: "123123",
  name: "Yumi"
)
yumi_img = "https://res.cloudinary.com/dmnm5ct2h/image/upload/v1669602940/Ozei/owner_bk6w9q.jpg"
file = URI.open(yumi_img)
yumi.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

puts "....Erika created! 💃🏻"
erika = User.create!(
  email: "Erika@ozei.fun",
  password: "123123",
  name: "Erika"
)
erika_img = "https://res.cloudinary.com/dmnm5ct2h/image/upload/v1669606747/Ozei/user3_z8b9za.jpg"
file = URI.open(erika_img)
erika.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

soren.save
mattias.save
yumi.save
erika.save
separator_line

# Creating all demo-restaurants
puts "Starting Creation of Demo-restaurants"
separator_line
puts "Creating Yumi's Thirsty Izakaya 🇯🇵"

yumi_restaurant = Restaurant.create!(
  user: yumi,
  name: "Yumi's Thirsty Izakaya",
  description: "Good Food & Alcohol on a budget",
  category: "All you can eat",
  address: "6-12 Jingumae, Shibuya Ku, Tokyo",
  maximum_number: 10,
  price_range: "¥1000"
)
index_img = 0
yumi_images = [
    "https://tblg.k-img.com/restaurant/images/Rvw/24093/640x640_rect_24093767.jpg",
    "https://fukulabo.net/images/A00006367.jpg?1496708313",
    "https://www.ssnp.co.jp/uploads/2022/10/221006shinjidai1-scaled.jpg",
    "https://eizaburo.net/img/s01.jpg"
  ]
4.times do
  file = URI.open("#{yumi_images[index_img]}")
  yumi_restaurant.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
  index_img += 1
  puts "added image #{yumi_images[index_img - 1]}"
end
yumi_restaurant.tag_list.add("Party")
yumi_restaurant.save
separator_line

puts "Creating Mattias's Pub 🇸🇪"
mattias_restaurant = Restaurant.create!(
  user: mattias,
  name: "Viking Sal",
  description: "Come drink, eat and have a real viking experience! Maybe even make some new viking friends?",
  category: "Pub",
  address: "1-8 Jingumae, Shibuya Ku, Tokyo to",
  maximum_number: 80,
  price_range: "¥5000"
)
mattias_index = 0
mattias_images = [
  "https://i0.wp.com/www.slowtravelstockholm.com/wp-content/uploads/2015/12/aifur-feature.jpg?fit=888%2C587&ssl=1",
  "https://www.routesnorth.com/wp-content/uploads/2018/03/aifur-stockholm.jpg.webp",
  "https://i.pinimg.com/736x/46/09/e4/4609e4d06863746e2c16a275f4364b1d--bar-grill-themed-weddings.jpg",
]
3.times do
  mattias_file = URI.open("#{mattias_images[mattias_index]}")
  mattias_restaurant.photos.attach(io: mattias_file, filename: "nes.png", content_type: "image/png")
  mattias_index += 1
  puts "added image #{mattias_images[mattias_index - 1]}"
end
mattias_restaurant.tag_list.add("Party")
mattias_restaurant.save
separator_line

puts "Creating Erika's Izakaya 🇧🇷"
erika_restaurant = Restaurant.create!(
  user: erika,
  name: "Izakaya Issa",
  description: "Good Food & Alcohol on a budget.",
  category: "Izakaya",
  address: "1-28 Yoyogi, Shibuya ku, Tokyo to",
  maximum_number: 50,
  price_range: "¥1000"
)
erika_index_img = 0
erika_images = [
    "https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/04/a0004442/img/en/a0004442_parts_5f3de161d28e0.jpg?20210114171346&q=80",
    "https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/04/a0004442/img/basic/a0004442_main.jpg?20210114171346&q=80",
    "https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/04/a0004442/img/en/a0004442_parts_5f3de1727eb71.jpg?20210114171346&q=80",
    "https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/04/a0004442/img/en/a0004442_parts_5f3de2311774a.jpg?20210114171346&q=80"
  ]
4.times do
  file = URI.open("#{erika_images[erika_index_img]}")
  erika_restaurant.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
  erika_index_img += 1
  puts "added image #{erika_images[erika_index_img - 1]}"
end
erika_restaurant.tag_list.add("Party")
erika_restaurant.save
separator_line
puts "Seeds finished 👷🏼‍♂️"
