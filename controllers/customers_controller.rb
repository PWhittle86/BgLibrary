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

get '/customers/new/' do
  erb (:"customers/add")
end

get '/customers/:id/edit' do
  @customer = Customer.find(params[:id])
  erb (:"customers/amend")
end

post '/customers/add/' do
  @customer = Customer.new(params)
  @customer.save
  erb (:"customers/cust_added")
end

post '/customers/:id/delete' do
  @customer = Customer.find(params[:id])
  @notification = Customer.find(params[:id])
  @customer.delete
  erb (:"customers/delete_confirmation")
end

post '/customers/:id/update/' do
  @customer = Customer.new(params)
  @customer.update
  erb (:"customers/update_confirmation")
end
