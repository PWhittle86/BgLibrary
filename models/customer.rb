require_relative('../db/sqlrunner')

class Customer

  attr_reader

  def initialize(customer_hash)
    @id = customer_hash['id'].to_i
    @first_name = customer_hash['first_name']
    @last_name = customer_hash['last_name']
    @age = customer_hash['age'].to_i
    @gender = customer_hash['gender']
  end

  

end
