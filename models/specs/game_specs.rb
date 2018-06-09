require('minitest/autorun')
require('minitest/rg')
require_relative('../game')

class Test_game < MiniTest::Test

  def setup
    game_hash =   {"title" => "Settlers of Catan",
      "genre" => "Negotiation",
      "theme" => "Settling"}

      @test_game = Game.new(game_hash)
  end

  def test_title #Checks whether the title field is being correctly populated.
    result = @test_game.title
    assert_equal("Settlers of Catan", result)
  end

  def test_genre #Checks whether the genre field is being correctly populated.
    result = @test_game.genre
    assert_equal("Negotiation", result)
  end

  def test_theme #Checks whether the theme field is being correctly populated.
    result = @test_game.theme
    assert_equal("Settling", result)
  end




end
