require_relative('../db/sqlrunner')

class Game

  attr_reader :id, :title, :genre, :theme, :status

  def initialize(game_hash)
    @id = game_hash['id']
    @title = game_hash['title']
    @genre = game_hash['genre']
    @theme = game_hash['theme']
    @status = game_hash['status']
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

  def save() #Adds an entry into the games table.
    sql = 'INSERT INTO games(title, genre, theme, status) VALUES($1, $2, $3, $4) RETURNING id'
    values = [@title, @genre, @theme, @status]
    output = SqlRunner.run(sql, values)
    @id = output[0]['id'].to_i
  end

  def update() #Updates an existing entry in the games table.
    sql = 'UPDATE games SET (title, genre, theme, status) = ($1, $2, $3, $4) WHERE id = $5'
    values = [@title, @genre, @theme, @status, @id]
    SqlRunner.run(sql, values)
  end

  def delete() #Deletes the selected game from the table.
    sql = 'DELETE FROM games WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end


end
