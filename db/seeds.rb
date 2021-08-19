# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

prices = [20.00, 15.00, 25.00]
class_styles = ["Ashtanga", "Vinyasa", "Hatha"]
texts = ["The old traditon of yoga and it´s practices have made my life so much nicer, more joyful and mindful so that I decided to share my experience with others. I now teach since 11 years and have been giving asana and philosphy courses, workshops and teacher trainings around the world."]
about_me = ["The old tradition of yoga and it's practices have made my life so much nicer, more joyful and mindful so that I decided to share my experience with others. I now teach since 11 years and have been giving asana and philosophy courses, workshops and teacher trainings around the world.",
  "I believe yoga is one element alongside others when it comes to leading a connected life. To lead a fulfilled life in harmony with my values means for me to flow with the waves that come and go and to rediscover my own space of love, strength and centering again and again.",
  "My teaching methodology can be described as personal. Yoga is personal to each and everyone of us. This is especially true during pregnancy. Yoga helps me connect with my baby and my partner. More importantly, the various exercises that I do regularly, have been changed my life.",
  "I work with my students as I do in my own practice, I teach with compassion, encouragement and deliver the education behind what we are trying to achieve and focus on when necessary so that my students feel confident in their newly learnt skill/hobby.",
  "My teaching method is to introduce a variety of different Asanas in an approachable and balanced manner, combining this with a range of breathing exercises to bring calm and suppleness to the body and mind. I also introduce students to a simple meditation practice."]
style = ["Ashtanga, Yin, Meditation", "Ashtanga, Vinyasa, Hatha", "Hatha, Ashtanga, Yin", "Yin, Bikram, Ashtanga", "Bikram, Kundalini, Ashtanga"]
first_name = ["Lena", "Eva Maria","Andrew", "Sandra", "Sven"]
last_name = ["Pujo", "Lopes","Manning","Nunes", "Miller"]
ratings = [5,4.5,4,3.5,3]
certification = [true, true, false, false, true]

puts "destroying all users"

User.destroy_all

puts "creating new users"

5.times do
  user = User.create(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: '123456',
    status: 1)
end

5.times do |i|
  user = User.create(
    email: Faker::Internet.email,
    first_name: first_name[i],
    last_name: last_name[i],
    password: '123456',
    about_me: about_me[i],
    certification: certification[i],
    style: style[i],
    ratings: ratings[i],
    status: 0)
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

Booking.destroy_all

20.times do
  booking = Booking.create(
    user_id: User.first,
    course_id: Course.first)
end
