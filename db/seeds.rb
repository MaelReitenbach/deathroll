# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a = Game.create(dice_nb: 50, player_nb: 2, bet: 5, started: false, finished: false)
b = Game.create(dice_nb: 250, player_nb: 2, bet: 50, started: false, finished: false)
c = Game.create(dice_nb: 1000, player_nb: 4, bet: 550, started: false, finished: false)
d = Game.create(dice_nb: 150, player_nb: 2, bet: 50, started: true, finished: true)
e = Game.create(dice_nb: 600, player_nb: 2, bet: 200, started: true, finished: true)