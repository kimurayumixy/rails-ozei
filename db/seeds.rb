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

# Demo Restaurants added
demoa_restaurant = Restaurant.create!(
  user: User.all.sample,
  name: "KAKUNIMARU",
  description: "Good Food & Alcohol on a budget",
  category: "All you can eat",
  address: "2-18-1 Kounan Minato-ku, Tokyo",
  maximum_number: 10,
  price_range: "¥ #{[1000,2000,3000,4000,5000,6000,7000,8000,9000,10000].sample}",
  longitude: 139.7407041,
  latitude: 35.6290234
)
index_img = 0
demoa_images = [
    "http://d2ij38769uvyqz.cloudfront.net/inshokuten-com/foodist/upload_picture/main_c3c308eeac071360e6142cb64ba61e92412b1657.JPG",
    "http://d2ij38769uvyqz.cloudfront.net/inshokuten-com/foodist/upload_picture/main_c676f68613c282dc75db672ba4e413fa78488b95.jpeg",
    "http://d2ij38769uvyqz.cloudfront.net/inshokuten-com/foodist/upload_picture/main_c676f68613c282dc75db672ba4e413fa78488b95.jpeg",
    "http://d2ij38769uvyqz.cloudfront.net/inshokuten-com/foodist/upload_picture/main_c676f68613c282dc75db672ba4e413fa78488b95.jpeg"
  ]
4.times do
  file = URI.open("#{demoa_images[index_img]}")
  demoa_restaurant.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
  index_img += 1
  puts "added image #{demoa_images[index_img - 1]}"
end
demoa_restaurant.tag_list.add("Party")
demoa_restaurant.save


demob_restaurant = Restaurant.create!(
  user: User.all.sample,
  name: "地酒一献 焼鳥 米の花",
  description: "Good Food & Alcohol on a budget",
  category: "All you can eat",
  address: "2-15-2 Kounan Minato-ku, Tokyo",
  maximum_number: 10,
  price_range: "¥ #{[1000,2000,3000,4000,5000,6000,7000,8000,9000,10000].sample}",
  longitude: 139.7421613,
  latitude: 35.6277939
)
index_img = 0
demob_images = [
    "https://tblg.k-img.com/restaurant/images/Rvw/91303/640x640_rect_91303862.jpg",
    "https://pbs.twimg.com/media/FgD9ufcaEAIK7Kg.jpg",
    "http://d2ij38769uvyqz.cloudfront.net/inshokuten-com/foodist/upload_picture/main_c676f68613c282dc75db672ba4e413fa78488b95.jpeg",
    "http://d2ij38769uvyqz.cloudfront.net/inshokuten-com/foodist/upload_picture/main_c676f68613c282dc75db672ba4e413fa78488b95.jpeg"
  ]
4.times do
  file = URI.open("#{demob_images[index_img]}")
  demob_restaurant.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
  index_img += 1
  puts "added image #{demob_images[index_img - 1]}"
end
demob_restaurant.tag_list.add("Party")
demob_restaurant.save


democ_restaurant = Restaurant.create!(
  user: User.all.sample,
  name: "渋谷 がりっと酒場",
  description: "Good Food & Alcohol on a budget",
  category: "All you can eat",
  address: "2-14-10 Kounan Minato-ku, Tokyo",
  maximum_number: 10,
  price_range: "¥ #{[1000,2000,3000,4000,5000,6000,7000,8000,9000,10000].sample}",
  longitude: 139.74205,
  latitude: 35.628642
)
index_img = 0
democ_images = [
    "https://imgfp.hotp.jp/IMGH/04/99/P024760499/P024760499_480.jpg",
    "https://shiblog.town/wp-content/uploads/2022/11/1_IMG_0175.jpg",
    "http://d2ij38769uvyqz.cloudfront.net/inshokuten-com/foodist/upload_picture/main_c676f68613c282dc75db672ba4e413fa78488b95.jpeg",
    "http://d2ij38769uvyqz.cloudfront.net/inshokuten-com/foodist/upload_picture/main_c676f68613c282dc75db672ba4e413fa78488b95.jpeg"
  ]
4.times do
  file = URI.open("#{democ_images[index_img]}")
  democ_restaurant.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
  index_img += 1
  puts "added image #{democ_images[index_img - 1]}"
end
democ_restaurant.tag_list.add("Party")
democ_restaurant.save

# Demo Restaurants added
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
  name: "Soren",
  phone_number: "080-1234-5678"
)
soren_img = "https://res.cloudinary.com/dmnm5ct2h/image/upload/v1669602938/Ozei/user_egrawp.jpg"
file = URI.open(soren_img)
soren.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

puts "....Mattias created! 🤓"
mattias = User.create!(
  email: "mattias@ozei.fun",
  password: "123123",
  name: "Mattias",
  phone_number: "080-5555-5555"
)
mattias_img = "https://res.cloudinary.com/dmnm5ct2h/image/upload/v1669606745/Ozei/user2_uqspmm.jpg"
file = URI.open(mattias_img)
mattias.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

puts "....Yumi created! 👩🏻"
yumi = User.create!(
  email: "Yumi@ozei.fun",
  password: "123123",
  name: "Yumi",
  phone_number: "080-1111-1111"
)
yumi_img = "https://res.cloudinary.com/dmnm5ct2h/image/upload/v1669602940/Ozei/owner_bk6w9q.jpg"
file = URI.open(yumi_img)
yumi.photo.attach(io: file, filename: "nes.png", content_type: "image/png")

puts "....Erika created! 💃🏻"
erika = User.create!(
  email: "Erika@ozei.fun",
  password: "123123",
  name: "Erika",
  phone_number: "080-5678-9012"
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
  name: "Thirsty Izakaya",
  description: "Good Food & Alcohol on a budget. Izakaya are one of Japan's quintessential experiences. If it's your first trip to Japan or you've been here for a lifetime, it's hard not to enjoy a beer and yarn with friends over some heavily salted fried food at this Japanese institution.",
  category: "All you can eat",
  address: "2-16-2 Kounan Minato-ku, Tokyo",
  maximum_number: 10,
  price_range: "¥1000",
  longitude: 139.7405342,
  latitude: 35.627763
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
  address: "2-15-2 Kounan Minato-ku, Tokyo",
  maximum_number: 80,
  price_range: "¥8000",
  longitude: 139.7419271,
  latitude: 35.6268112
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
  address: "2-7-19 Kounan Minato-ku, Tokyo",
  maximum_number: 50,
  price_range: "¥5000",
  longitude: 139.7425331,
  latitude: 35.627763
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

puts "Creating Soren's Izakaya"
soren_restaurant = Restaurant.create!(
  user: soren,
  name: "Soren's Diner",
  description: "You can enjoy authentic BBQ in the middle of Shibuya. Our BBQ course is not only about grilled vegetables and meat! We also serve salted cabbage and edamame as snacks, cheese fondue, garlic toast, and even dessert! You are sure to be very satisfied! This price is unbeatable in Tokyo...!",
  category: "Izakaya",
  address: "2-14-10 Kounan Minato-ku, Tokyo",
  maximum_number: 50,
  price_range: "¥2000",
  longitude: 139.7421108,
  latitude: 35.6286195
)
soren_index_img = 0
soren_images = [
    "https://lh3.googleusercontent.com/p/AF1QipMku7dqMLVy1U9TXDDOudz7unwsSqpC6fKH2s6z=w1080-h608-p-no-v0",
    "https://ximg.retty.me/resize/s600x600/q80/das/-/retty/img_ebisu/restaurant/100001344783/archive/1223315-5db80bed6aeb0-l.JPG",
    "https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/04/a0004442/img/en/a0004442_parts_5f3de1727eb71.jpg?20210114171346&q=80",
    "https://rimage.gnst.jp/livejapan.com/public/article/detail/a/00/04/a0004442/img/en/a0004442_parts_5f3de2311774a.jpg?20210114171346&q=80"
  ]
4.times do
  file = URI.open("#{soren_images[soren_index_img]}")
  soren_restaurant.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
  soren_index_img += 1
  puts "added image #{soren_images[soren_index_img - 1]}"
end
soren_restaurant.tag_list.add("Party")
soren_restaurant.save
separator_line
puts "Seeds finished 👷🏼‍♂️"
