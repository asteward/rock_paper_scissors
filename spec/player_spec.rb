require 'rspec'
require 'player'

describe 'Player' do
  describe 'initialize'do
    it 'initializes a Player object' do
      new_player = Player.new("PLAYER ONE","ROCK")
      expect(new_player).to be_an_instance_of Player
    end
  end

  describe 'hand_check' do
    it 'checks for a valid hand choice' do
      new_player = Player.new("PLAYER ONE","ROCK")
      expect(new_player.hand_check).to be true
    end

    it 'checks for a valid hand choice' do
      new_player = Player.new("PLAYER ONE","PAPER")
      expect(new_player.hand_check).to be true
    end

    it 'checks for a valid hand choice' do
      new_player = Player.new("PLAYER ONE","SCISSORS")
      expect(new_player.hand_check).to be true
    end

    it 'checks for a valid hand choice' do
      new_player = Player.new("PLAYER ONE","LASER BEAM")
      expect(new_player.hand_check).to be false
    end
  end

  describe 'compare_hands' do
    it 'returns the winner of rock-paper-scissors game between two players' do
      player = Player.new("PLAYER ONE","ROCK")
      player2 = Player.new("PLAYER TWO","PAPER")
      expect(player.compare_hands(player2)).to eq player2
    end
  end
end
