require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/game')
require_relative('../models/customer')
also_reload('./models/*')

get '/games' do
  erb (:"games/index")
end
