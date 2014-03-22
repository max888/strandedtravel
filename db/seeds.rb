# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Destination.delete_all

destinations = Destination.create! ([
  { city: 'Barcelona', country: 'Spain', description: 'Barcelona is hot, energetic, and full of life.  The city has beaches, mountains, great architecture, hills, art works, and a vibrant history.  The people are great and the life is good.  Top everything off with a little touch of Catalunyan pride and you have Barcelona.', user_id: 2},
  { city: 'Queenstown', country: 'New Zealand', description: 'The lake and mountain landscape make it suited to all kinds of adventure. There’s skiing in the winter and activities such as bungy jumping, sky diving, canyon swinging, jet boating, horse trekking and river rafting all year round. If hardcore adventure isnt your thing, there are plenty of mellow options available.', user_id: 2},
  { city: 'Lagos', country: 'Portugal', description: 'Amazing surfing and partying at the bottom of Portugal', user_id: 2},
  { city: 'Split', country: 'Croatio', description: 'Set sail from here on one of the amazing yacht weeks', user_id: 2},
  { city: 'Budapest', country: 'Hungary', description: 'Explore all the ruin bars for a night of your life', user_id: 2},
  { city: 'Sydney', country: 'Australia', description: 'beaches babes and beers', user_id: 2},
  { city: 'London', country: 'United Kingdom', description: 'Pubs and sports in the cultural capital', user_id: 2},
  { city: 'Krakow', country: 'Poland', description: 'youthful vibe in a city full of history', user_id: 2}
  ])