# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# { name:'', cost: '50000', photo:'' }

puts "destroying all bookings"
Booking.destroy_all

puts "destroying all spaceships"
Spaceship.destroy_all

puts "destroying all users"
User.destroy_all


puts "creating 2 users"
# user = User.create!(first_name: 'Ofir', last_name: 'Elboym', email: 'test@test.com', password: '123456')
# user2 = User.create!(first_name: 'Ben', last_name: 'Aronov', email: 'ben@test.com', password: '123456')
# TODO change this when we have user photo uploader for avatars !!!
user = User.create!(first_name: 'Elon', last_name: 'Musk', email: 'test@test.com', password: '123456', remote_photo_url: "https://pbs.twimg.com/profile_images/378800000305778238/852d2f76797dbe1da82095f988d38fbe_400x400.png" )
user2 = User.create!(first_name: 'Donald', last_name: 'Trump', email: 'trump@test.com', password: '123456', remote_photo_url: "https://pbs.twimg.com/profile_images/705575079258812420/cMMNr1UJ_400x400.jpg" )
user3 = User.create!(first_name: 'Lance', last_name: 'Armstrong', email: 'lance@test.com', password: '123456', remote_photo_url: "https://i.guim.co.uk/img/static/sys-images/Guardian/Pix/pictures/2005/07/24/lanceafp128ready.jpg?width=300&quality=85&auto=format&fit=max&s=3a8b55f200e6466e3ad7a9a898d11172" )

SHIPNAMES = ["Neptune's Folley", "Spaceship X", "Delta 67", "Beoing E-37", "Normandy", "Denim", "Baby Blue Alpaca", "Greenest Grass", "Jordin Sparks-No Air", "Kappa 3"]
LAUNCH_SITES = ["Houston, TX", "Austin, TX", "Florida", "Miami", "Hawaii", "Tel Aviv", "Beit Arye", "My Pants", "Vegas", "Le Wagon", "NASA"]

PHOTOS =[
  "https://res.cloudinary.com/flameleviosa/image/upload/v1574869528/0404-X37-launch-Pentagon_mp1y1u.jpg",
  "https://res.cloudinary.com/flameleviosa/image/upload/v1574869528/maxresdefault_jojkov.jpg",
  "https://res.cloudinary.com/flameleviosa/image/upload/v1574869528/spacex-normandy-640x353_wh80wy.jpg",
  "https://res.cloudinary.com/flameleviosa/image/upload/v1574869529/34c47267ea04098ea12a9b9731b2a51d_tkvbtg.jpg",
  "https://res.cloudinary.com/flameleviosa/image/upload/v1574869529/spacex-crew-dragon-spaceship-nasa-commercial-crew-program-illustration-42878298755a9670c6596o_jqwfus.jpg",
  "https://res.cloudinary.com/flameleviosa/image/upload/v1574869530/BFR-2018-spaceship-and-booster-sep-SpaceX-1c_dlkh3x.jpg"
]


puts "creating 5 spaceships"
5.times do
  Spaceship.create!(
    user: user,
    name: SHIPNAMES.sample,
    cost: (5000..100000).to_a.sample,
    remote_photo_url: PHOTOS.sample,
    launch_site: LAUNCH_SITES.sample
    )
end

puts "creating 5 spaceships for user2"
5.times do
  Spaceship.create!(
    user: user2,
    name: SHIPNAMES.sample,
    cost: (5000..100000).to_a.sample,
    remote_photo_url: PHOTOS.sample,
    launch_site: LAUNCH_SITES.sample
    )
end

puts "creating 5 spaceships for user3"
5.times do
  Spaceship.create!(
    user: user3,
    name: SHIPNAMES.sample,
    cost: (5000..100000).to_a.sample,
    remote_photo_url: PHOTOS.sample,
    launch_site: LAUNCH_SITES.sample
    )
end

puts "Making some bookings for user"

ofirs_ships = Spaceship.where(user: user);

5.times do
  Booking.create!(
    user: user2,
    spaceship: ofirs_ships.sample,
    date: Date.today + ([0, 1, 10].sample)
    )

end

3.times do
  Booking.create!(
    user: user,
    spaceship: ofirs_ships.sample,
    date: Date.today + ([0, 2, 14].sample)
    )

end

  puts "finished seeding!"
