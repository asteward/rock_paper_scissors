require 'rspec'
require 'game'

describe 'Game' do
  describe 'initialize' do
    it 'initializes a new game for two players' do
      new_game = Game.new("Player1", "Player2")
      expect(new_game).to be_an_instance_of Game
    end
  end
end
