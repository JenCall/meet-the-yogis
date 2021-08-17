# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

prices = [20.00, 15.00, 12.00, 25.00, 10.00, 5.00, 18.00]
class_styles = ["Ashtanga Yoga", "Vinyasa Yoga", "Vinyasa Flow Yoga", "Hatha Yoga", "Power Yoga", "Yin Yoga", "Kundalini Yoga", "Iyengar Yoga", "Jivamukti Yoga", "Sivananda Yoga", "Sivananda Yoga", "Bikram Yoga"]
texts = ["The old traditon of yoga and it´s practices have made my life so much nicer, more joyful and mindful so that I decided to share my experience with others. I now teach since 11 years and have been giving asana and philosphy courses, workshops and teacher trainings around the world."]

puts "destroying all users"
User.destroy_all
puts "creating new users"

10.times do
  user = User.new(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: '123456')
  user.save!
end

puts "destroying all courses"
Course.destroy_all
puts "creating new courses"

15.times do
  course = Course.new(
    classstyle: class_styles.sample,
    title: "Yoga with #{Faker::Name.last_name}",
    description: texts.sample,
    address: Faker::Address.city,
    price: prices.sample,
    user: User.all.sample)
  course.save!
end
