# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'open-uri'

images = ["https://images.unsplash.com/photo-1545205597-3d9d02c29597?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"]

prices = [20.00, 15.00, 12.00, 25.00, 10.00, 5.00, 18.00]

class_styles = ["Ashtanga", "Vinyasa", "Yin"]

texts = ["A strong class that follows the traditional sequence of Ashtanga Primary serie with focus upon strength, flexibility and breath. The class itself lead but with support from the teacher to faciilitat the individual needs. Open for both medium and avanced students.",
"This class moves from pose to pose with each held for no more than five to eight breaths. Expect a fully balanced class of forward bending, twists, backbends with opportunity for inversions. Open for every level from beginner to advanced students.",
"In this class, postures are practiced to align, strengthen and promote flexibility in the body. Breathing techniques and meditation are also integrated. You can expect an emphasis on simplicity, repetition, and ease of movement. Open for medium and avanced students.",
"Our signature hot Power Yoga classes will tone, strengthen and purify your body. The dynamic mix of sweat and surrender will challenge you to your edge and encourage you to reach your true potential. The Power sequence is a series of postures that flow from one to the next, on breath. Modifications offered for less intense and more advanced pose options. Open for all level.",
"This all-levels class begins with a slow to moderate vinyasa flow followed by a calming, meditative Yin practice. Yin Yoga is a passive practice where seated poses are held from 3 to 5 minutes. The practice of Yin emphasizes stillness, surrender, and compassion. Passively holding seated poses increases flexibility, releases long-held tension, lengthens deep tissues, and cultivates body and breath awareness preparing the body and the mind for deeper experiences in meditation. Open for all level",
"Free yourself from addictions or unwanted habits and thought patterns through our Kundalini Yoga community support classes.
These weekly classes utilize Kundalini Yoga, meditation and breathing techniques to create important shifts in your physical, mental, emotional and spiritual states of being. We also explore stress management, self-reflection, lifestyle and other tools to help you achieve your best future self.",
"This Iyengar Yoga class is offered to all level students, from beginners to advanced. Together we make the healing practice of yoga accessible to all through the use of skillful instruction, yoga props, individual pose modifications, and hands-on adjustments. The philosophy of yoga and its positive effect on our daily lives is incorporated into this class.",
"This class is designed for busy people who only have an hour to practice. The class is fast-paced and invigorating and is certainly a “get-in-shape” class. The structure is a fixed set sequence instructed in a vinyasa style. It is a fully balanced class that includes asana warm-up, chanting, a setting of intention.",
"This intermediate class is open to persons who are familiar with yoga practise. It is therefore advised that start with classes for yoga beginners before you take this class. You will expand your regular practice by learning new variations of the postures to build strength and flexibility and experience more deeper aspects of Hatha yoga. Open for advanced students.",
"The traditional class is done in either silence with limited verbal commands or set to music and is only suitable for students who have a regular Bikram practice and know the series fairly well. It’s a nice meditative practice allowing you to practice a more intense mindfulness of your personal practice. Open for medium and advanced students. Not recommended for beginners."
]

about_me = ["The old tradition of yoga and it's practices have made my life so much nicer, more joyful and mindful so that I decided to share my experience with others. I now teach since 11 years and have been giving asana and philosophy courses, workshops and teacher trainings around the world.",
  "I believe yoga is one element alongside others when it comes to leading a connected life. To lead a fulfilled life in harmony with my values means for me to flow with the waves that come and go and to rediscover my own space of love, strength and centering again and again. Open for advanced students.",
  "My teaching methodology can be described as personal. Yoga is personal to each and everyone of us. This is especially true during pregnancy. Yoga helps me connect with my baby and my partner. More importantly, the various exercises that I do regularly, have been changed my life.",
  "I work with my students as I do in my own practice, I teach with compassion, encouragement and deliver the education behind what we are trying to achieve and focus on when necessary so that my students feel confident in their newly learnt skill/hobby.",
  "My teaching method is to introduce a variety of different Asanas in an approachable and balanced manner, combining this with a range of breathing exercises to bring calm and suppleness to the body and mind. I also introduce students to a simple meditation practice."]

style = ["Ashtanga, Yin, Meditation", "Ashtanga, Vinyasa, Hatha", "Hatha, Ashtanga, Yin", "Yin, Bikram, Ashtanga", "Bikram, Kundalini, Ashtanga"]

first_name = ["Lena", "Eva Maria","Andrew", "Sandra", "Sven"]

last_name = ["Pujo", "Lopes","Manning","Nunes", "Miller"]

ratings = [5,4.5,4,3.5,3]

hours = ["200", "500", "800", "500", "800", "200"]

level = ["Beginner", "Medium", "Advanced"]

start_time = ["16:00:00", "17:00:00", "18:00:00"]
end_time = ["17:00:00", "18:00:00", "19:00:00"]


certification = [true, true, false, false, true]


puts "destroying all courses"
Course.destroy_all

Booking.destroy_all

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
    certificationhours: hours[i],
    style: style[i],
    ratings: ratings[i],
    status: 0)
end

puts "creating new courses"

15.times do |i|
 Course.create(
    classstyle: class_styles.sample,
    title: "Yoga course with #{Faker::Name.first_name} #{Faker::Name.last_name}",
    description: texts.sample,
    address: Faker::Address.full_address,
    price: prices.sample,
    #level: level.sample,
    user: User.teachers.sample,
    date: Faker::Date.forward(days: 23),
    start_time: start_time[i],
    end_time: end_time[i]
    )
  end

20.times do
  booking = Booking.create(
    user: User.first,
    course: Course.first)
end
