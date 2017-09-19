# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create([
  {name: 'Grant', genera: 'RPG', game: 'Breath of the Wild', gender: 'M', hours: 'Pasific'},
  {name: 'Lucy', genera: 'RPG', game: 'Skyrim', gender: 'F', hours: 'Eastern'},
  {name: 'Keith', genera: 'Strategy', game: 'XCOM 2', gender: 'M', hours: 'Pasific'},
  {name: 'Suzy', genera: 'Casual', game: 'Animal Crossing', gender: 'F', hours: 'Pasific'},
])
