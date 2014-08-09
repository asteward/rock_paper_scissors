require 'rspec'
require 'player'

describe 'Player' do
  describe 'initialize'do
    it 'initializes a Player object' do
      new_player = Player.new("ROCK")
      expect(new_player).to be_an_instance_of Player
    end
  end
end
