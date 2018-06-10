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

get '/customers/:id' do
  @customer = Customer.find(params[:id])
  erb (:"customers/show")
end
