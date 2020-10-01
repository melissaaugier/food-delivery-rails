require 'faker'


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Meal.destroy_all
Customer.destroy_all

puts "Creating new users ..."
user = User.new(name: 'Mel', email: 'test@resas.com', password: '1234567' )
puts "New users have been created ..."


puts "Creating new meals ..."
10.times do
  meal = Meal.new(
    user: user,
    name:    Faker::Food.dish,
    price: rand(8..10)
  )
  meal.save!
end
puts "New meals have been created ..."

puts "Creating new customers ..."
10.times do
  customer = Customer.new(
    user: user,
    name:    Faker::Name.name,
    address: Faker::Address.street_address
  )
  customer.save!
end
puts "New customers have been created ..."
