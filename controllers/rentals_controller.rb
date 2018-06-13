require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/game')
require_relative('../models/customer')
also_reload('./models/*')

get '/rentals' do
  @rented_games = Game.not_available
  erb (:"rentals/index")
end

get '/rentals/:id/new' do
  @customer = Customer.find(params[:id])
  @games = Game.available
  erb (:"rentals/create")
end

post '/rentals/create' do
  @game = Game.find(params[:game_id])
  @customer = Customer.find(params[:customer_id])

  @game.rent(params[:customer_id])
  erb (:"rentals/rent_successful")
end

post '/rentals/:id/return' do
  @game = Game.find(params[:id])
  @game.renter = nil
  @game.update
  erb (:"rentals/rent_returned")
end
