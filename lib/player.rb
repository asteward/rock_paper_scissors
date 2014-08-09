class Player
  attr_reader :hand
  def initialize(hand)
    @hand = hand
  end

  def compare_hands(other_player)
    winner = "TIE"
    if self.hand == "ROCK"
      if other_player.hand == "ROCK"
        winner = "TIE"
      elsif other_player.hand == "PAPER"
        winner = other_player
      else
        winner = self
      end
    elsif self.hand == "PAPER"
      if other_player.hand == "ROCK"
        winner = self
      elsif other_player.hand == "PAPER"
        winner = "TIE"
      else
        winner = other_player
      end
    else
      if other_player.hand == "ROCK"
        winner = other_player
      elsif other_player.hand == "PAPER"
        winner = self
      else
        winner = "TIE"
      end
    end
    winner
  end
end
