require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/game')
require_relative('../models/customer')
also_reload('./models/*')

get '/customers' do
  @customers = Customer.all
  erb (:"/customers/index")
end
