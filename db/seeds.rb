# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

about_me = ["The old tradition of yoga and it's practices have made my life so much nicer, more joyful and mindful so that I decided to share my experience with others. I now teach since 11 years and have been giving asana and philosophy courses, workshops and teacher trainings around the world.",
  "I believe yoga is one element alongside others when it comes to leading a connected life. To lead a fulfilled life in harmony with my values means for me to flow with the waves that come and go and to rediscover my own space of love, strength and centering again and again.",
  "My teaching methodology can be described as personal. Yoga is personal to each and everyone of us. This is especially true during pregnancy. Yoga helps me connect with my baby and my partner. More importantly, the various exercises that I do regularly, have been changed my life.",
  "I work with my students as I do in my own practice, I teach with compassion, encouragement and deliver the education behind what we are trying to achieve and focus on when necessary so that my students feel confident in their newly learnt skill/hobby.",
  "My teaching method is to introduce a variety of different Asanas in an approachable and balanced manner, combining this with a range of breathing exercises to bring calm and suppleness to the body and mind. I also introduce students to a simple meditation practice."]

style = ["Ashtanga", "Vinyasa", "Hatha", "Yin", "Bikram", "Kundalini"]

ratings = [5,4.5,4,3.5,3]


User.destroy_all

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
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    password: '123456',
    about_me: about_me[i],
    certification: true,
    style: style.sample,
    ratings: ratings.sample,
    status: 0)
end


course = Course.create(title: "Ashtanga")

Booking.destroy_all

20.times do
  booking = Booking.create(
    user_id: User.first,
    course_id: Course.first)
end
