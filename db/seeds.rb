# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Muser.create([
  {name: 'Grant', genera: 'RPG', game: 'Breath of the Wild', hours: 'Pasific'},
  {name: 'Keith', genera: 'Strategy', game: 'XCOM 2', hours: 'Pasific'},
])

Fuser.create([
  {name: 'Lucy', genera: 'RPG', game: 'Skyrim', hours: 'Eastern'},
  {name: 'Suzy', genera: 'Casual', game: 'Animal Crossing', hours: 'Pasific'},
])
