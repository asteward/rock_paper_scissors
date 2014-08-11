class Game
  attr_accessor :round, :winners

  def initialize()
    @round = 0
    @winners = []
  end

  def add_winner(player)
    @winners << player
  end
end
