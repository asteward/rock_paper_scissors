require 'rspec'
require 'round'

describe 'Round' do
  describe 'initialize' do
    it 'initializes a new round for two players' do
      new_round = Round.new("Player1", "Player2")
      expect(new_round).to be_an_instance_of Round
    end
  end
end
