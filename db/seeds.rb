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

style = ["Ashtanga", "Hatha", "Yin", "Bikram", "Kundalini", "Vinyasa"]

first_name = ["Lena", "Eva Maria","Andrew", "Sandra", "Sven"]

last_name = ["Pujo", "Lopes","Manning","Nunes", "Miller"]

ratings = [5,4.5,4,3.5,3]

hours = ["200", "500", "800", "500", "800", "200"]

level = ["Beginner", "Medium", "Advanced"]

start_time = ["16:00", "17:00", "18:00"]
end_time = ["17:00", "18:00", "19:00"]


certification = [true, true, false, false, true]

addresses = ["Tegelbacken 4, 111 52, Stockholm",
  "Klarafaret, 111 52, Stockholm",
  "Fredsgatan 12, 111 52, Stockholm",
  "Tegelbacken, 111 52, Stockholm",
  "Drottninggatan 17, 111 51, Stockholm",
  "Tegelbacken 8, 111 52, Stockholm",
  "Tegelbacken 6, 111 52, Stockholm",
  "Tegelbacken 10, 111 52, Stockholm",
  "Herkulesgatan 24, 111 52, Stockholm",
  "Vasagatan 4, 111 20, Stockholm"]

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

avatar_images = [
  "https://images.unsplash.com/photo-1586297135537-94bc9ba060aa?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
  "https://images.unsplash.com/photo-1569913486515-b74bf7751574?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=635&q=80",
  "https://images.unsplash.com/photo-1624298357597-fd92dfbec01d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
  "https://images.unsplash.com/photo-1544725176-7c40e5a71c5e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1047&q=80",
  "https://images.unsplash.com/photo-1623330188314-8f4645626731?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=659&q=80",
  "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
  "https://images.unsplash.com/photo-1607746882042-944635dfe10e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80",
  "https://images.unsplash.com/photo-1558898479-33c0057a5d12?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
  ]

card_images = [
  "https://images.unsplash.com/photo-1575052814086-f385e2e2ad1b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
  "https://images.unsplash.com/photo-1566501206188-5dd0cf160a0e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
  "https://images.unsplash.com/photo-1586035758264-c5c685f55e9c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
  "https://images.unsplash.com/photo-1552196563-55cd4e45efb3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=926&q=80",
  "https://images.unsplash.com/photo-1601779144646-5e6a43c5d615?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
  "https://images.unsplash.com/photo-1547852356-b20668106c51?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
  "https://images.unsplash.com/photo-1579454566790-f9e5697ddf36?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=681&q=80",
  "https://images.unsplash.com/photo-1608404862898-ca7de5c2eb4a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80"
  ]

5.times do |i|
  user = User.create(
    email: Faker::Internet.email,
    first_name: first_name[i],
    last_name: last_name[i],
    password: '123456',
    about_me: about_me[i],
    certification: certification.sample,
    certificationhours: hours.sample,
    style: style.sample,
    ratings: ratings.sample,
    status: 0)
  card = URI.open(card_images[i])
  avatar = URI.open(avatar_images[i])
  user.profile_avatar.attach(io: avatar, filename: "avatar_#{i}.jpg")
  user.card_image.attach(io: card, filename: "card_#{i}.jpg")

end

puts "creating new courses"

courses_images = [
  "https://images.unsplash.com/photo-1588286840104-8957b019727f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
  "https://images.unsplash.com/photo-1510894347713-fc3ed6fdf539?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
  "https://images.unsplash.com/photo-1518611012118-696072aa579a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
  "https://images.unsplash.com/photo-1549576490-b0b4831ef60a?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
  "https://images.unsplash.com/photo-1573384666979-2b1e160d2d08?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1110&q=80",
  "https://images.unsplash.com/photo-1608405059861-b21a68ae76a2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80",
  "https://images.unsplash.com/photo-1535007829477-d13662ffb714?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1538&q=80",
  "https://images.unsplash.com/photo-1523293457621-4c51beb16d37?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80",
  "https://images.unsplash.com/photo-1604431696980-07e518647bec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1055&q=80",
  "https://images.unsplash.com/photo-1517363898874-737b62a7db91?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=958&q=80",
  "https://images.unsplash.com/photo-1528319725582-ddc096101511?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
  "https://images.unsplash.com/photo-1616699002805-0741e1e4a9c5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
  "https://images.unsplash.com/photo-1518310952931-b1de897abd40?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1051&q=80",
  "https://images.unsplash.com/photo-1593811167565-4672e6c8ce4c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1052&q=80",
  "https://images.unsplash.com/photo-1611094607507-8c8173e5cf33?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1050&q=80",
  "https://images.unsplash.com/photo-1529693662653-9d480530a697?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1489&q=80",
  "https://images.unsplash.com/photo-1591228127791-8e2eaef098d3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"
]

15.times do |i|
 course = Course.create(
    classstyle: class_styles.sample,
    title: "Yoga with #{Faker::Name.first_name} #{Faker::Name.last_name}",
    description: texts.sample,
    address: addresses.sample,
    price: prices.sample,
    level: level.sample,
    user: User.teachers.sample,
    date: Faker::Date.forward(days: 23),
    start_time: start_time.sample,
    end_time: end_time.sample)
  courses_photo = URI.open(courses_images.sample)
  course.photo.attach(io: courses_photo, filename: "courses_photo_#{i}.jpg")
  end

20.times do
  booking = Booking.create(
    user: User.first,
    course: Course.first)
end
