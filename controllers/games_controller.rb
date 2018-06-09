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
