require_relative('../db/sqlrunner')

class Game

  attr_reader :id, :title, :genre, :theme

  def initialize(game_hash)
    @id = game_hash['id'].to_i
    @title = game_hash['title']
    @genre = game_hash['genre']
    @theme = game_hash['theme']
  end

  def self.delete_all() #Deletes all rows in the games table.
    sql = 'DELETE FROM games'
    values = []
    SqlRunner.run(sql, values)
  end

  def save() #Adds an entry into the games table.
    sql = 'INSERT INTO games(title, genre, theme) VALUES($1, $2, $3) returning *'
    values = [@title, @genre, @theme]
    output = SqlRunner.run(sql, values)
    @id = output[0][:id].to_i
  end

  def update() #Updates an existing entry in the games table.
    sql = 'UPDATE game SET (title, genre, theme) = ($1, $2, $3) WHERE id = $4'
    values = [@title, @genre, @theme, @id]
    SqlRunner.run(sql, values)
  end

  def delete() #Deletes the selected game from the table.
    sql = 'DELETE FROM games WHERE $1 = id'
  end







end
