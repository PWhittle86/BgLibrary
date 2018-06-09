require('pry-byebug')
require_relative('../models/game')
require_relative('../models/customer')

#The seeds below are games to initially populate the game library. The categories and themes have been selected in such a way to aid testing later functions, such as the ability to be able to filter stock results by genre or theme.

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

customer1 = Customer.new(
{"first_name" => "Peter",
  "last_name" => "Whittle",
  "age" => "31",
  "gender" => "Male"}
)

customer1.save

customer2 = Customer.new(
{"first_name" => "Jennifer",
  "last_name" => "Whittle",
  "age" => "29",
  "gender" => "Female"}
)

customer2.save

customer3 = Customer.new(
{"first_name" => "Matt",
  "last_name" => "Lloyd",
  "age" => "29",
  "gender" => "Male"}
)

customer3.save

customer4 = Customer.new(
{"first_name" => "Becky",
  "last_name" => "Drinkwater",
  "age" => "25",
  "gender" => "Female"}
)

customer4.save

binding.pry
nil
