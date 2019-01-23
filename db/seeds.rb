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


child1 = Child.create(name: "Kenny", password: "password", hp:100, hunger: 100, location_x: 1, location_y: 1, admin: true )
child2 = Child.create(name: "Wil", password: "password", hp:100, hunger: 100, location_x: 1, location_y: 2 )
child3 = Child.create(name: "Peter", password: "password", hp:100, hunger: 100, location_x: 1, location_y: 3 )
child4 = Child.create(name: "John", password: "password", hp:100, hunger: 100, location_x: 2, location_y: 3 )
child5 = Child.create(name: "Steve", password: "password", hp:100, hunger: 100, location_x: 2, location_y: 1 )
child6 = Child.create(name: "Duck", password: "password", hp:100, hunger: 100, location_x: 3, location_y: 4 )

food1 = Food.create(name: "Pizza", location_x: 3, location_y: 2, hunger_decrease: rand(1..20))
food2 = Food.create(name: "Fries", location_x: 2, location_y: 3, hunger_decrease: rand(1..20))
food3 = Food.create(name: "Cheese", location_x: 2, location_y: 3, hunger_decrease: rand(1..20))
food4 = Food.create(name: "Fruit", location_x: 2, location_y: 2, hunger_decrease: rand(1..20))
food5 = Food.create(name: "Soda", location_x: 3, location_y: 1, hunger_decrease: rand(1..20))

doctor1 = Doctor.create(name: "Dr. Bob", location_x: 2, location_y: 1, hp_increase: rand(20..40))
doctor2 = Doctor.create(name: "Dr. Dr.", location_x: 1, location_y: 1, hp_increase: rand(20..40))
doctor3 = Doctor.create(name: "Dr. Pepper", location_x: 2, location_y: 3, hp_increase: rand(20..40))
doctor4 = Doctor.create(name: "Dr. My Guy", location_x: 1, location_y: 3, hp_increase: rand(20..40))
doctor5 = Doctor.create(name: "Dr. Duckmans", location_x: 1, location_y: 2, hp_increase: rand(20..40))

bird1 = Bird.create(species: "Duck", sickness: false, attack:10)
bird2 = Bird.create(species: "Pigeon", sickness: true, attack:40)
bird3 = Bird.create(species: "Chicken", sickness: false, attack:20)
bird4 = Bird.create(species: "Swan", sickness: true, attack:25)
bird5 = Bird.create(species: "Cow", sickness: false, attack:99)
bird6 = Bird.create(species: "Albatross", sickness: false, attack:40)
bird7 = Bird.create(species: "Seagull", sickness: true, attack:30)
bird8 = Bird.create(species: "Finch", sickness: false, attack:10)
bird9 = Bird.create(species: "Sparrow", sickness: true, attack:10)
bird10 = Bird.create(species: "Goose", sickness: false, attack:20)

attack1 = Attack.create(child_id: child1.id, bird_id: bird1.id)
attack2 = Attack.create(child_id: child2.id, bird_id: bird2.id)
attack3 = Attack.create(child_id: child3.id, bird_id: bird3.id)
attack4 = Attack.create(child_id: child4.id, bird_id: bird1.id)
attack5 = Attack.create(child_id: child5.id, bird_id: bird5.id)
