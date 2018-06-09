require_relative('../db/sqlrunner')

class Customer

  attr_reader :id,
  attr_accessor :first_name, :last_name, :age, :gender

  def initialize(customer_hash)
    @id = customer_hash['id'].to_i
    @first_name = customer_hash['first_name']
    @last_name = customer_hash['last_name']
    @age = customer_hash['age'].to_i
    @gender = customer_hash['gender']
  end

  def self.delete_all() #Deletes all customers from the table.
    sql = 'DELETE FROM customers'
    values = []
    SqlRunner.run(sql, values)
  end

  def save() #Adds an entry to the customers table.
    sql = 'INSERT INTO customers (first_name, last_name, age, gender) VALUES ($1, $2, $3, $4) RETURNING *'
    values = [@first_name, @last_name, @age, @gender]
    output = SqlRunner.run(sql, values)
    @id = output[0][:id].to_i
  end

  def update() #Updates the specified entry in the customers table.
    sql = 'UPDATE customers SET (first_name, last_name, age, gender) = ($1, $2, $3, $4) WHERE id = $5'
    values = [@first_name, @last_name, @age, @gender, @id]
    SqlRunner.run(sql, values)
  end

  def delete() #Deletes the specified customer from the table.
    sql = 'DELETE FROM customers WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end





end
