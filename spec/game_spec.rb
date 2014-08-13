require 'rspec'
require 'game'

describe 'Game' do
  describe 'initialize' do
    it 'initializes a new game' do
      new_game = Game.new()
      expect(new_game).to be_an_instance_of Game
    end
  end

  describe 'add_winner' do
    it 'adds the winner of the round to the list of winners' do
      new_game = Game.new()
      player1 = Player.new({:name => "PLAYER ONE", :hand => "SCISSORS"})
      player2 = Player.new({:name => "PLAYER TWO", :hand => "PAPER"})
      winner = player1.compare_hands(player2)
      expect(new_game.add_winner(winner)).to eq [player1]
    end
  end
end
