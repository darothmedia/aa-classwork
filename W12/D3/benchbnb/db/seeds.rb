# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([{username: 'Bob', password: 'BobTheBuilder'}, {username: 'Liam', password: 'LiamNeeson'}, {username: 'Adrian', password: 'AdrienBrody'}])

Bench.create([{description: 'A place to stay', lat: 37.748975, lng: -122.418152}, {description: 'Another spot', lat: 37.745959, lng: -122.415968}])