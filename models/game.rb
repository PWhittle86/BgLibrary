require_relative('../db/sqlrunner')

class Game

  attr_reader :id, :title, :genre, :theme, :renter

  def initialize(game_hash)
    @id = game_hash['id']
    @title = game_hash['title']
    @genre = game_hash['genre']
    @theme = game_hash['theme']
    @renter = nil
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

  def self.available
  end

  def save() #Adds an entry into the games table.
    sql = 'INSERT INTO games(title, genre, theme) VALUES($1, $2, $3) RETURNING id'
    values = [@title, @genre, @theme]
    output = SqlRunner.run(sql, values)
    @id = output[0]['id'].to_i
  end

  def update() #Updates an existing entry in the games table.
    sql = 'UPDATE games SET (title, genre, theme) = ($1, $2, $3) WHERE id = $4'
    values = [@title, @genre, @theme, @id]
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
