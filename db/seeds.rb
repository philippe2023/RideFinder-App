# db/seeds.rb

require 'faker'

# Enable skip_validations for development seeding
$skip_validations = true

puts "Cleaning database..."
Ride.delete_all
User.delete_all

puts "Creating users with roles..."
5.times do |i|
  User.create!(
    email: "rider#{i + 1}@example.com",
    password: "password123",
    role: "rider"
  )

  User.create!(
    email: "driver#{i + 1}@example.com",
    password: "password456",
    role: "driver"
  )
end

puts "Users created!"
$skip_validations = false # Reset after seeding

puts "Creating rides..."
drivers = User.where(role: "driver")
CITIES = %w[Berlin Hamburg Munich Frankfurt Cologne Düsseldorf Leipzig Stuttgart Dortmund]

15.times do
  departure_city = CITIES.sample
  arrival_city = (CITIES - [ departure_city ]).sample

  drivers.sample.rides.create!(
    departure_location: departure_city,
    arrival_location: arrival_city,
    departure_time: Faker::Time.forward(days: rand(1..10), period: :morning),
    price_per_seat: rand(10..50),
    available_seats: rand(1..5),
    additional_info: Faker::Lorem.sentence(word_count: 10),
    status: "available"
  )
end

puts "Rides created!"

# Create bookings
puts "Creating bookings..."
rides = Ride.all
passengers = User.where(role: "rider")

5.times do
  Booking.create!(
    passenger: passengers.sample,
    ride: rides.sample,
    status: %w[pending confirmed completed].sample
  )
end
puts "Bookings created!"
