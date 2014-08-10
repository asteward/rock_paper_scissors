class Game
  attr_reader :winners

  def initialize()
    @winners = []
  end

  def add_winner(player)
    @winners << player
  end
end
