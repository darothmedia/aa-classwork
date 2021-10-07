# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  [
    { username: 'Johnson' },
    { username: 'John' },
    { username: 'Jacky' },
    { username: 'Jamie' },
    { username: 'Jordan' }
  ]
)

Artwork.create(
  [
    { 
      title: 'Mona Lisa',
      image_url: 'monalisa.uk',
      artist_id: 1
    },
    {
      title: 'Venus',
      image_url: 'venus.com',
      artist_id: 2
    },
    {
      title: 'Scream',
      image_url: 'sceam.org',
      artist_id: 3
    }
  ]
)

ArtworkShare.create(
  [
    {
      viewer_id: 4,
      artwork_id: 3
    },
    {
      viewer_id: 5,
      artwork_id: 2
    },
    {
      viewer_id: 5,
      artwork_id: 1
    }
  ]
)