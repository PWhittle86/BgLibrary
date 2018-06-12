require_relative('../db/sqlrunner')
require_relative('./customer')

class Game

  attr_reader :id, :title, :genre, :theme
  attr_accessor :renter

  def initialize(game_hash)
    @id = game_hash['id']
    @title = game_hash['title']
    @genre = game_hash['genre']
    @theme = game_hash['theme']
    @renter = game_hash['renter'] if game_hash['renter'] != nil
  end

  def self.delete_all() #Deletes all rows in the games table.
    sql = 'DELETE FROM games'
    values = []
    SqlRunner.run(sql, values)
  end

  def self.all() #Selects all games in the table.
    sql = 'SELECT * FROM games'
    values = []
    output = SqlRunner.run(sql, values)
    output.map{|table_entries| Game.new(table_entries)}
  end

  def self.find(id) #Used to find a specific game from the database based upon the game's id.
    sql = 'SELECT * FROM games where id = $1'
    values = [id]
    found_item = SqlRunner.run(sql, values)
    result = Game.new(found_item.first)
    return result
  end

  def self.find_by_name(user_input) #Used to allow the user to search for a game within his stock by name. Returns the first game in the object array.
    sql = "SELECT * FROM games WHERE title LIKE '%' || $1 || '%'"
    values = [user_input]
    objects_array = SqlRunner.run(sql, values)
    games_array = objects_array.map{|game| Game.new(game)}
    return games_array.first
  end

  def self.available #Used to identify games that are not currently being rented.
    sql = 'SELECT * FROM games WHERE renter IS NULL'
    values = []
    output = SqlRunner.run(sql, values)
    output.map{|game| Game.new(game)}
  end

  def self.not_available #Used to identify games that are currently being rented.
    sql = 'SELECT * FROM games WHERE renter IS NOT NULL'
    values = []
    output = SqlRunner.run(sql, values)
    output.map{|game| Game.new(game)}
  end

  def find_renter() #Returns the customer renting a game.
    sql = 'SELECT * FROM customers WHERE id = $1'
    values = [@renter]
    found_item = SqlRunner.run(sql, values)
    customer = Customer.new(found_item.first)
    return customer
  end

  def save() #Adds an entry into the games table.
    sql = 'INSERT INTO games(title, genre, theme) VALUES($1, $2, $3) RETURNING id'
    values = [@title, @genre, @theme]
    output = SqlRunner.run(sql, values)
    @id = output[0]['id'].to_i
  end

  def update() #Updates an existing entry in the games table.
    sql = 'UPDATE games SET (title, genre, theme, renter) = ($1, $2, $3, $4) WHERE id = $5'
    values = [@title, @genre, @theme, @renter, @id]
    SqlRunner.run(sql, values)
  end

  def delete() #Deletes the selected game from the table.
    sql = 'DELETE FROM games WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def rent(customer_id)
    sql = 'UPDATE games SET renter = $1 WHERE id = $2'
    values = [customer_id, @id]
    SqlRunner.run(sql, values)
  end

end
