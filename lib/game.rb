class Game
  attr_accessor :round, :winners, :tie_games

  def initialize()
    @round = 1
    @winners = []
    @tie_games = 0
  end

  def add_winner(player)
    @winners << player
  end
end
