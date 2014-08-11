class Player
  attr_accessor :name, :hand
  def initialize(name)
    @name = name
    @hand = nil
  end

  def compare_hands(other_player)
    winner = "TIE"
    if self.hand == "R"
      if other_player.hand == "R"
        winner = "TIE"
      elsif other_player.hand == "P"
        winner = other_player
      else
        winner = self
      end
    elsif self.hand == "P"
      if other_player.hand == "R"
        winner = self
      elsif other_player.hand == "P"
        winner = "TIE"
      else
        winner = other_player
      end
    else
      if other_player.hand == "R"
        winner = other_player
      elsif other_player.hand == "P"
        winner = self
      else
        winner = "TIE"
      end
    end
    winner
  end
end
