# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Child.destroy_all
Food.destroy_all
Doctor.destroy_all
Bird.destroy_all
Attack.destroy_all


child1 = Child.create(name: "Kenny", password: "password", hp:100, hunger: 100, location_x: 1, location_y: 1 )
child2 = Child.create(name: "Wil", password: "password", hp:100, hunger: 100, location_x: 1, location_y: 2 )
child3 = Child.create(name: "Peter", password: "password", hp:100, hunger: 100, location_x: 1, location_y: 3 )
child4 = Child.create(name: "John", password: "password", hp:100, hunger: 100, location_x: 2, location_y: 3 )
child5 = Child.create(name: "Steve", password: "password", hp:100, hunger: 100, location_x: 2, location_y: 1 )
child6 = Child.create(name: "Duck", password: "password", hp:100, hunger: 100, location_x: 3, location_y: 4 )

food1 = Food.create(name: "Pizza", location_x: 3, location_y: 2, hunger_decrease: rand(1..100))
food2 = Food.create(name: "Fries", location_x: 2, location_y: 3, hunger_decrease: rand(1..100))
food3 = Food.create(name: "Cheese", location_x: 2, location_y: 3, hunger_decrease: rand(1..100))
food4 = Food.create(name: "Fruit", location_x: 2, location_y: 2, hunger_decrease: rand(1..100))
food5 = Food.create(name: "Soda", location_x: 3, location_y: 1, hunger_decrease: rand(1..100))

doctor1 = Doctor.create(name: "Dr. Bob", location_x: 2, location_y: 1, hp: rand(20..50))
doctor2 = Doctor.create(name: "Dr. Dr.", location_x: 1, location_y: 1, hp: rand(20..50))
doctor3 = Doctor.create(name: "Dr. Pepper", location_x: 2, location_y: 3, hp: rand(20..50))
doctor4 = Doctor.create(name: "Dr. My Guy", location_x: 1, location_y: 3, hp: rand(20..50))
doctor5 = Doctor.create(name: "Dr. Duckmans", location_x: 1, location_y: 2, hp: rand(20..50))

bird1 = Bird.create(species: "Duck", sickness: false, attack:1)
bird2 = Bird.create(species: "Pigeon", sickness: false, attack:50)
bird3 = Bird.create(species: "Chicken", sickness: false, attack:25)
bird4 = Bird.create(species: "Swans", sickness: true, attack:30)
bird5 = Bird.create(species: "Cow", sickness: false, attack:100)

attack1 = Attack.create(date:"2014-12-01", child_id: child1, bird_id: bird1)
attack2 = Attack.create(date:"2014-12-01", child_id: child2, bird_id: bird2)
attack3 = Attack.create(date:"2014-12-01", child_id: child3, bird_id: bird3)
attack4 = Attack.create(date:"2014-12-01", child_id: child4, bird_id: bird1)
attack5 = Attack.create(date:"2014-12-01", child_id: child5, bird_id: bird5)
