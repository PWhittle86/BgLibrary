require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/game')
require_relative('../models/customer')
also_reload('./models/*')

get '/rentals' do
  erb (:"rentals/index")
end

get '/rentals/:id/new' do
  @customer = Customer.find(params[:id])
  @games = Game.all
  erb (:"rentals/create")
end

post '/rentals/create' do
  @game = Game.find(params[:game_id])
  @customer = Customer.find(params[:customer_id])

  @game.rent(params[:customer_id])
  erb (:"rentals/rent_successful")
end

{"customer_id"=>"1", "game_id"=>"1", "captures"=>[]}
