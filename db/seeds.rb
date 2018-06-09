require('pry-byebug')
require_relative('../models/game')


#The seeds below are games that have been added to the library.

game1 = Game.new(
  {"title" => "Memoir 44",
  "genre" => "Wargame",
  "theme" => "World War 2"}
)

game1.save

game2 = Game.new(
  {"title" => "Kemet",
  "genre" => "Wargame",
  "theme" => "Ancient Egypt"}
)

game2.save

game3 = Game.new(
  {"title" => "Cosmic Encounter",
  "genre" => "Negotiation",
  "theme" => "Outer Space"}
)

game3.save

game4 = Game.new(
  {"title" => "Twilight Imperium",
  "genre" => "4X",
  "theme" => "Outer Space"}
)

game4.save

game5 = Game.new(
  {"title" => "Eclipse: Dawn of a New Galaxy",
  "genre" => "4X",
  "theme" => "Outer Space"}
)

game5.save


###################################################



binding.pry
nil
