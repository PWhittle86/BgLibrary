require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/game')
require_relative('../models/customer')
also_reload('./models/*')

get '/games' do
  @games = Game.all
  erb (:"games/index")
end

get '/games/:id' do
  @game = Game.find(params[:id])
  erb (:"games/show")
end

get '/games/new/' do
  erb (:"games/add")
end

post '/games/:id/delete' do
  @game = Game.find(params[:id])
  @notification = Game.find(params[:id])
  @game.delete
  erb (:"games/delete_confirmation")
end

post '/games/create/' do
  @game = Game.new(params)
  @game.save
  erb (:"games/game_added")
end
