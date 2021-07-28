# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
puts "Cleaning items..."
Item.destroy_all
puts "Cleaning invites..."
Invite.destroy_all
puts "Cleaning lists..."
List.destroy_all
puts "Cleaning users"
User.destroy_all

puts "Everything is cleaned. Time to create stuff"
file1 = URI.open("https://i.pravatar.cc/150?img=52")
file2 = URI.open("https://i.pravatar.cc/150?img=34")
file3 = URI.open("https://i.pravatar.cc/150?img=60")
file4 = URI.open("https://i.pravatar.cc/150?img=51")

puts "Creating user 1..."
user1 = User.create(email: "clotilde@listin.com", password:"123456", first_name:"Clotilde")
User.last.avatar.attach(io: file1, filename: 'nes.jpg', content_type: 'image/jpg')
User.last.save!

puts "Creating user 2..."
user2 = User.create(email: "clotou@listin.com", password:"123456", first_name:"Clotou")
User.last.avatar.attach(io: file2, filename: 'nes.jpg', content_type: 'image/jpg')
User.last.save!

puts "Creating user 3..."
user3 = User.create(email: "loulette@listin.com", password:"123456", first_name:"Loulette")
User.last.avatar.attach(io: file3, filename: 'nes.jpg', content_type: 'image/jpg')
User.last.save!

puts "Creating user 4..."
user4 = User.create(email: "doudou@listin.com", password:"123456", first_name:"Doudou")
User.last.avatar.attach(io: file4, filename: 'nes.jpg', content_type: 'image/jpg')
User.last.save!

#Setting up List1
puts "Creating one list 1..."
list1 = List.create(name: "sweet 30th", user_id:user1.id)
invite1 = Invite.create(list_id:list1.id, user_id: user2.id, accepted: true)
invite2 = Invite.create(list_id:list1.id, user_id: user3.id)
invite3 = Invite.create(list_id:list1.id, user_id: user4.id, accepted: true)

item1 = Item.create(list_id:list1.id, user_id: user1.id, title: "eggs", quantity: 12)
item2 = Item.create(list_id:list1.id, user_id: user1.id, title: "chocolate", quantity: 1)
item3 = Item.create(list_id:list1.id, user_id: user2.id, title: "PQ", quantity: 1)
item4 = Item.create(list_id:list1.id, user_id: user2.id, title: "milk", quantity: 6)
item5 = Item.create(list_id:list1.id, user_id: user2.id, title: "olive oil", quantity: 1, done: true)
item6 = Item.create(list_id:list1.id, user_id: user4.id, title: "strawberries", quantity: "1 box", done: true)
item7 = Item.create(list_id:list1.id, user_id: user4.id, title: "pastas", quantity: "3 kg", done: true)

#Setting up List2
puts "Creating one list 2..."
list2 = List.create(name: "week-end party", user_id:user2.id)
invite4 = Invite.create(list_id:list2.id, user_id: user3.id, accepted: true)
invite5 = Invite.create(list_id:list2.id, user_id: user1.id, accepted: true)
invite6 = Invite.create(list_id:list2.id, user_id: user4.id)

item7 = Item.create(list_id:list2.id, user_id: user1.id, title: "pringles", quantity: 4)
item8 = Item.create(list_id:list2.id, user_id: user3.id, title: "bieres", quantity: 30)
item9 = Item.create(list_id:list2.id, user_id: user2.id, title: "PQ", quantity: 2)
item10 = Item.create(list_id:list2.id, user_id: user1.id, title: "bread", quantity: 6)
item11 = Item.create(list_id:list2.id, user_id: user2.id, title: "butter", quantity: 1)
item12 = Item.create(list_id:list2.id, user_id: user3.id, title: "nutella", quantity: 1)
item13 = Item.create(list_id:list2.id, user_id: user2.id, title: "sheese", quantity: 3, done: true)
item14 = Item.create(list_id:list2.id, user_id: user3.id, title: "eggs", quantity: 12, done: true)

#Setting up List3
puts "Creating one list 3..."
list3 = List.create(name: "baby-shower", user_id:user3.id)
invite7 = Invite.create(list_id:list3.id, user_id: user2.id, accepted: true)
invite8 = Invite.create(list_id:list3.id, user_id: user1.id)
invite9 = Invite.create(list_id:list3.id, user_id: user4.id, accepted: true)

item15 = Item.create(list_id:list3.id, user_id: user2.id, title: "guirlande", quantity: 1)
item16 = Item.create(list_id:list3.id, user_id: user3.id, title: "bonbons", quantity: 4)
item17 = Item.create(list_id:list3.id, user_id: user2.id, title: "paillettes", quantity: 2)
item18 = Item.create(list_id:list3.id, user_id: user2.id, title: "amandes", quantity: 6)
item19 = Item.create(list_id:list3.id, user_id: user2.id, title: "sucre", quantity: 1)
item20 = Item.create(list_id:list3.id, user_id: user3.id, title: "nappe papier", quantity: 1)
item21 = Item.create(list_id:list3.id, user_id: user2.id, title: "cornets", quantity: 15)
item22 = Item.create(list_id:list3.id, user_id: user3.id, title: "gobelets", quantity: 20)
item23 = Item.create(list_id:list3.id, user_id: user3.id, title: "nutella", quantity: 1, done: true)
item24 = Item.create(list_id:list3.id, user_id: user2.id, title: "sheese", quantity: "3 diff", done: true)
item25 = Item.create(list_id:list3.id, user_id: user3.id, title: "eggs", quantity: 12, done: true)
item40 = Item.create(list_id:list3.id, user_id: user4.id, title: "HAM", quantity: "for 6", done: true)
item41 = Item.create(list_id:list3.id, user_id: user4.id, title: "salmon", quantity: "6-8 slices", done: true)
item42 = Item.create(list_id:list3.id, user_id: user4.id, title: "candies", quantity: "1 box", done: true)

#Setting up List3
puts "Creating one list 4..."
list4 = List.create(name: "batch party", user_id:user4.id)
invite10 = Invite.create(list_id:list4.id, user_id: user2.id, accepted: true)
invite11 = Invite.create(list_id:list4.id, user_id: user1.id, accepted: true)
invite12 = Invite.create(list_id:list4.id, user_id: user3.id, accepted: true)

item26 = Item.create(list_id:list4.id, user_id: user2.id, title: "guirlande", quantity: 1)
item27 = Item.create(list_id:list4.id, user_id: user3.id, title: "bonbons", quantity: 4)
item28 = Item.create(list_id:list4.id, user_id: user2.id, title: "paillettes", quantity: 2)
item29 = Item.create(list_id:list4.id, user_id: user4.id, title: "amandes", quantity: 6)
item30 = Item.create(list_id:list4.id, user_id: user2.id, title: "sucre", quantity: 1)
item31 = Item.create(list_id:list4.id, user_id: user3.id, title: "nappe papier", quantity: 1)
item32 = Item.create(list_id:list4.id, user_id: user2.id, title: "cornets", quantity: 15)
item33 = Item.create(list_id:list4.id, user_id: user3.id, title: "gobelets", quantity: 20)
item34 = Item.create(list_id:list4.id, user_id: user3.id, title: "nutella", quantity: 1, done: true)
item35 = Item.create(list_id:list4.id, user_id: user4.id, title: "sheese", quantity: "3 diff", done: true)
item36 = Item.create(list_id:list4.id, user_id: user3.id, title: "eggs", quantity: 12, done: true)
item37 = Item.create(list_id:list4.id, user_id: user4.id, title: "gaspaccio", quantity: "1 L", done: true)
item38 = Item.create(list_id:list4.id, user_id: user4.id, title: "yaourt", quantity: 24, done: true)
item39 = Item.create(list_id:list4.id, user_id: user3.id, title: "beurre", quantity: 3, done: true)

puts "All good, seed is ready"
